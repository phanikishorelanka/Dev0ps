#!/bin/sh
az account list --all --query "[?state=='Enabled'].id" --output tsv | while read subscription
do
    az account set -s "$subscription"
    az group list --query "[?type == 'Microsoft.Resources/resourceGroups'].name" --output tsv | while read resource_group_name
    do
        az network nsg list --resource-group "$resource_group_name" --output tsv | tr '\t' ',' 
    done
done
