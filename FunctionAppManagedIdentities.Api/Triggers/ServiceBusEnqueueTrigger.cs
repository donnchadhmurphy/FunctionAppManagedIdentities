using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;
using System;

namespace FunctionAppManagedIdentities.Api.Triggers
{
    public static class ServiceBusEnqueueTrigger
    {
        [FunctionName(nameof(ServiceBusEnqueueTrigger))]
        [return: ServiceBus("%SerivceBusQueueName%", Connection = "ServiceBusConnection")]
        public static string ServiceBusOutput([TimerTrigger("*/10 * * * * *")] TimerInfo myTimer, ILogger log)
        {
            log.LogInformation($"C# Timer (Service Bus Enqueue) trigger function executed at: {DateTime.Now}");
            return $"{DateTime.Now}";
        }
    }
}
