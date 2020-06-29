az acr create -n cbttest -g CBTAzure --sku Standard

az acr login --name cbttest

docker pull nginx

docker run -it -p 8080:80 nginx

docker tag nginx cbttest.azurecr.io/repo/nginx

docker push cbttest.azurecr.io/repo/nginx