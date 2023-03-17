param azureRegion string = resourceGroup().location
param appNamePrefix string = uniqueString(resourceGroup().id)

param acrName string = '${appNamePrefix}-kineteco-acr'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: acrName
  location: azureRegion
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}
