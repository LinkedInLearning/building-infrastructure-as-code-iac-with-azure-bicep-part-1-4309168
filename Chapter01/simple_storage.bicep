// simple_storage.bicep

@description('The Azure region for the deployment')
param accountName string = 'kinetecostg0220'
param location string = resourceGroup().location
param aspName string = 'asp-bicepwebsites0220'

@description('A simple test storage account')
resource kinetEcoStorageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: accountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Refactor ASP resource
@description('Generated from /subscriptions/xxx')
resource aspbicepwebsites 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: aspName
  kind: 'app'
  location: location
  tags: {
    Environment: 'Test'
    Project: 'Bicep-Part1'
  }
  properties: {
    serverFarmId: 7333
    name: aspName
    workerSize: 'Default'
    workerSizeId: 0
    currentWorkerSize: 'Default'
    currentWorkerSizeId: 0
    currentNumberOfWorkers: 1
    webSpace: 'bicep-part1-webapp-eastus2-EastUS2webspace'
    planName: 'VirtualDedicatedPlan'
    computeMode: 'Dedicated'
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    tags: {
      Environment: 'Test'
      Project: 'Bicep-Part1'
    }
    kind: 'app'
    reserved: false
    isXenon: false
    hyperV: false
    mdmId: 'waws-prod-bn1-197_7333'
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
  sku: {
    name: 'B1'
    tier: 'Basic'
    size: 'B1'
    family: 'B'
    capacity: 1
  }
}
