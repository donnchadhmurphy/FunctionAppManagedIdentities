@minLength(1)
@maxLength(260)
@description('Resource name for Service Bus Queue')
param resourceName string

param eventHubNamespace string

resource eventHub 'Microsoft.EventHub/namespaces/eventhubs@2017-04-01' = {
  name: '${eventHubNamespace}/${resourceName}'
  properties: {
    messageRetentionInDays: 7
    partitionCount: 1
  }
}
