// simple_storage.bicep

@description('The Azure region for the deployment')
param location string = resourceGroup().location

@description('')
resource kinetEcoStorageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'kinetecostg0220'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
