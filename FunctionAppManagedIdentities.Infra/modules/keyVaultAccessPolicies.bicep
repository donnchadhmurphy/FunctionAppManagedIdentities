@minLength(3)
@maxLength(24)
@description('Resource name for Key Vault')
param keyVaultResourceName string

@description('Managed Identity ID')
param managedIdentityId string

resource accessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2019-09-01' = {
  name: '${keyVaultResourceName}/add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: managedIdentityId
        permissions: {
          secrets: [
            'get'
            'list'
          ]
        }
      }
    ]
  }
}
