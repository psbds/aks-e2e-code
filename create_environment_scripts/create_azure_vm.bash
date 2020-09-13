#/bin/bash
AZURE_RESOURCE_GROUP="aksguiderg"
AZURE_RESOURCE_NAME="aksguide"
AZURE_RESOURCE_REGION="eastus"

az group create --name $AZURE_RESOURCE_GROUP --location $AZURE_RESOURCE_REGION

az vm create \
      --resource-group $AZURE_RESOURCE_GROUP \
      --name $AZURE_RESOURCE_NAME \
      --size Standard_D2s_v3 \
      --image UbuntuLTS \
      --admin-username azureuser \
      --generate-ssh-keys \
      --location $AZURE_RESOURCE_REGION

PUBLIC_IP=$(az vm show -d -g $AZURE_RESOURCE_GROUP -n $AZURE_RESOURCE_NAME --query publicIps -o tsv)
ssh azureuser@$PUBLIC_IP