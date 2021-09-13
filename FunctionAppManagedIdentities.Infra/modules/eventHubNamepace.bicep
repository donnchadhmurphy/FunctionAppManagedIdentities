@minLength(6)
@maxLength(50)
@description('Resource name for Service Bus')
param resourceName string

resource namespace 'Microsoft.EventHub/namespaces@2017-04-01' = {
  name: resourceName
  location: resourceGroup().location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
  properties: {}
}

output eventHubNamespace string = namespace.name
