//

module storageDeploy 'br/KinetEcoBicepModules:storage:1.0.0' = {
  name: 'kineteco-storage-deployment'
  params:{
    azureRegion: 'eastus2'
    geoRedundancy: false
    namePrefix: 'dev'
    paramStorageName: 'kinetecopilotwebstg36'
  }
}
