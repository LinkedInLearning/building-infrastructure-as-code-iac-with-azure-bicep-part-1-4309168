// kineteco-webapp-w-insights.bicep

@description('The Azure region for the deployment')
param location string = resourceGroup().location
param appNamePrefix string = 'kt0228'

@description('App service name.')
param appServiceAppName string = '${appNamePrefix}-myapp'

@description('App service plan name.')
param appServicePlanName string = '${appNamePrefix}-appplan'

@description('App Insights name.')
param appInsightName string = '${appNamePrefix}-insights'

resource appServicePlan 'Microsoft.Web/serverFarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2020-06-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightName
  location: location
  kind: 'web'
  properties: {
    ApplicationId: appServiceApp.id
    Application_Type: 'web'
  }
}

@description('Provides a deployed apps host name.')
output webAppHostName string = appServiceApp.properties.defaultHostName
