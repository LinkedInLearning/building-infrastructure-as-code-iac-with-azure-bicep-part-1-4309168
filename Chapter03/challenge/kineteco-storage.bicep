// kineteco-storage.bicep

@description('The Azure region for the deployment')
param location string = resourceGroup().location
param accountNamePrefix string = 'ktstg0228'

// Note: Kineteco name prefix + department name should be less than 24 characters
param storageConfig object = {
  marketing: {
    name: '${accountNamePrefix}marketing'
    skuName: 'Standard_LRS'
  }
  accounting: {
    name: '${accountNamePrefix}accounting'
    skuName: 'Premium_LRS'
  }
  itoperations: {
    name: '${accountNamePrefix}itoperations'
    skuName: 'Premium_LRS'
  }
  development: {
    name: '${accountNamePrefix}development'
    skuName: 'Standard_LRS'
  }
}

resource createKinetEcoStorages 'Microsoft.Storage/storageAccounts@2021-02-01' = [for config in items(storageConfig): {
  name: '${config.value.name}'
  location: location
  sku: {
    name: config.value.skuName
  }
  kind: 'StorageV2'
}]
