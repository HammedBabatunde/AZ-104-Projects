targetScope='subscription'

param resourceGroupName string
param resourceGroupLocation string

//create resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}
