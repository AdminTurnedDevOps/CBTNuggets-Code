az appservice plan create --name "pythonwebapp92plan" `
                          --resource-group "CBTAzure" `
                          --is-linux `
                          --sku "FREE" `

az webapp create --name "pythonwebapp92" `
                 --plan "pythonwebapp92plan" `
                 --resource-group "CBTAzure" `
                 --runtime "python|3.7"