// parent_child_storage.bicep

param location string = resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'newparentchildstg22'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties:{
    accessTier: 'Hot'
  }
}
