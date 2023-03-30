param vnetName string
param addressPrefix string
param subnet1Name string
param subnet1Prefix string
param subnet2Name string
param subnet2Prefix string

param azureRegion string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: azureRegion
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
  }
}

resource subnet1 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: subnet1Name
  parent: vnet
  properties: {
    addressPrefix: subnet1Prefix
  }
}

resource subnet2 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: subnet2Name
  parent: vnet
  properties: {
    addressPrefix: subnet2Prefix
  }
}
