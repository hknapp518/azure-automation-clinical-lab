// Key Vault Template
// Deploys an Azure Key Vault with an access policy for the specified object ID

param vaultName string = 'kv-clinical-harrison518'
param objectId string = 'b2396262-beab-4ffb-b40c-db6ca7cd42a4'

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaultName
  location: resourceGroup().location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableSoftDelete: true
    enablePurgeProtection: true
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: objectId
        permissions: {
          secrets: [
            'get'
            'list'
            'set'
            'delete'
          ]
        }
      }
    ]
  }
}

