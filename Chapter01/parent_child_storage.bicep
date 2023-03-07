// parent_child_storage.bicep

param location string = resourceGroup().location
param stgAccountName string = 'newparentchildstg22'
var containerNames = [
  'inputs'
  'outputs'
  'errors'
]

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: stgAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties:{
    accessTier: 'Hot'
  }
}

@description('Option 1: Parent and child storage account provisioning with Blob service')
resource myBlobService 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  name: 'default'
  parent: storageaccount

  resource internalContainer 'containers@2022-09-01' = {
    name: 'internalcontainer'
  }
}

@description('Option 2: Blob container - a child resource creation with reference to the parent.')
resource myStorageContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  name: 'data-logs'
  parent: myBlobService
}

@description('Option 3')
resource listedContainers 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = [ for containerName in containerNames: {
  name: '${storageaccount.name}/default/${containerName}'
}]
