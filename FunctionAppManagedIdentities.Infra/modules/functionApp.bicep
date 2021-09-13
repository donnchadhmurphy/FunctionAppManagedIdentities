@minLength(2)
@maxLength(60)
@description('Resource name for Azure Function')
param resourceName string

@description('Envrionment name')
@allowed([
  'stag'
  'prod'
])
param env string

param appServicePlanId string
param storageAccountName string
param appInsightsInstrumentationKey string
param serviceBusNamespaceName string
param serviceBusQueueName string
param eventHubNamespaceName string
param eventHubName string

resource functionApp 'Microsoft.Web/sites@2021-01-15' = {
  name: resourceName
  location: resourceGroup().location
  kind: 'functionapp'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage__accountName '
          value: storageAccountName
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~3'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsightsInstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: 'InstrumentationKey=${appInsightsInstrumentationKey}'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
        {
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        }
        {
          name: 'ServiceBusConnection__fullyQualifiedNamespace'
          value: '${serviceBusNamespaceName}.servicebus.windows.net'
        }
        {
          name: 'SerivceBusQueueName'
          value: serviceBusQueueName
        }
        {
          name: 'EventHubName'
          value: eventHubName
        }
        {
          name: 'EventHubConnection__fullyQualifiedNamespace'
          value: '${eventHubNamespaceName}.servicebus.windows.net'
        }
      ]
    }
    clientCertMode: 'Optional'
  }
  tags: {
    Environment: env == 'stag' ? 'Staging' : 'Production'
  }
}

output managedIdentityPrincipalId string = functionApp.identity.principalId
output resourceId  string = functionApp.id
