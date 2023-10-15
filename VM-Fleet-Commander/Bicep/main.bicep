@description('The name of you Virtual Machine.')
param vmName string

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The size of the VM')
param vmSize string = 'Standard_D2s_v3'

@description('Username for the Virtual Machine.')
param adminUsername string

@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string

@description('Number of VMs to deploy.')
param vmCount int

module network './modules/network.bicep' = {
  name: 'virtual-network'
  params: {
    location: location
  }
}



module vm './modules/vm.bicep' = {
  name: 'virtual-machine'
  params: {
    vmName: vmName
    location: location
    vmSize: vmSize
    adminUsername: adminUsername
    adminPasswordOrKey: adminPasswordOrKey
    vnetName: network.outputs.vnetName
    vmCount: vmCount
  }
}


