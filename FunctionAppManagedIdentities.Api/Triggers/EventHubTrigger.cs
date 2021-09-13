using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;
using System;

namespace FunctionAppManagedIdentities.Api.Triggers
{
    public static class EventHubOutput
    {
        [FunctionName(nameof(EventHubOutput))]
        [return: EventHub("%EventHubName%", Connection = "EventHubConnection")]
        public static string Run([TimerTrigger("*/10 * * * * *")] TimerInfo myTimer, ILogger log)
        {
            log.LogInformation($"C# Timer trigger (Event Hub Enqueue) function executed at: {DateTime.Now}");
            return $"{DateTime.Now}";
        }
    }
}
