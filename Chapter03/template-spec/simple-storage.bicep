@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param storageAccountType string = 'Standard_LRS'

@description('Azure region for resource deployment.')
param location string = resourceGroup().location

@description('KinetEco storage account name')
param stgName string = 'stg${uniqueString(resourceGroup().id)}'

resource stgResource 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name:  stgName
  location: location
  sku: {
    name: storageAccountType
  }
  kind:'StorageV2'
}
