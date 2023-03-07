// https://github.com/Azure/bicep-registry-modules

// Sample demonstration of virtual network creation from Public registry

module kinetEcoVNet 'br/public:network/virtual-network:1.1.1' = {
  name: 'kinetEcoVnet'
  params: {
    addressPrefixes: [
      '10.0.0.0/16'
    ]
    name: 'kinetEco-min-vnet'
  }
}
