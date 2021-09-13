using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;

namespace FunctionAppManagedIdentities.Api.Triggers
{
    public static class ServiceBusDequeue
    {
        [FunctionName(nameof(ServiceBusDequeue))]
        public static void Run([ServiceBusTrigger("%SerivceBusQueueName%", Connection = "ServiceBusConnection")] string myQueueItem, ILogger log)
        {
            log.LogInformation($"C# Service Bus queue trigger function processed message: {myQueueItem}");
        }
    }
}
