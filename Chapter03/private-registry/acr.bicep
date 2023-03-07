// az group create -n 'kineteco-private-registry-test-eastus2' -l 'eastus2'
// az acr create --name "kinetecodevregistry" --sku Basic -g 'kineteco-private-registry-test-eastus2'

param location string = resourceGroup().location
param acrName string = 'kinetecodevregistry'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}
