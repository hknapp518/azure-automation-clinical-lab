// Main Infrastructure Template
// Deploys:
//   - VNet
//   - Subnet
//   - NSG
//   - Storage Account + Blob Service + Container


param location string = 'eastus'
param vnetName string = 'vnet-clinical'
param subnetName string = 'subnet-clinical'

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}


resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'nsg-clinical'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-RDP'
        properties: {
          priority: 1000
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '24.73.12.194/32'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

param storageAccountName string = 'clinical${substring(uniqueString(resourceGroup().id), 0, 8)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    encryption: {
      services: {
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource blobServices 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
  parent: storageAccount
  name: 'default'
  properties: {}
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
  parent: blobServices
  name: 'patient-records'
  properties: {
    publicAccess: 'None'
  }
}


resource kv 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: 'kv-clinical-harrison518'
}

module vmModule 'vm.bicep' = {
  name: 'deployVM'
  params: {
    vmName: 'clinical-vm'
    adminUsername: 'HarrisonAdmin'
    adminPassword: kv.getSecret('VmAdminPassword')
    subnetId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
  }
}
