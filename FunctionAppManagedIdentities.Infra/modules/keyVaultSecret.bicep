@minLength(1)
@maxLength(127)
@description('Resource name for Key Vault Secret')
param resourceName string

@secure()
@description('Secret value')
param secretValue string

@minLength(3)
@maxLength(24)
@description('Resource name for Key Vault')
param keyVaultResourceName string

resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: keyVaultResourceName
}

resource keyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: '${keyVaultResourceName}/${resourceName}'
  properties: {
    value: secretValue
  }
}
