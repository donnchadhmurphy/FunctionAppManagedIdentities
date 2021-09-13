call az deployment group create --mode Incremental --resource-group rg-demo-fami-westeu -f main.bicep --parameters azDeploy.params.json -c
