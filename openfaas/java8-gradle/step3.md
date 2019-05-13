### Build  the function
Now use the faas-cli to build the function, you will see gradle kick in and start downloading 
the dependencies it needs:

`faas-cli build -f hello-java.yml`{{execute}}

### Deploy the built function

`faas-cli deploy -f hello-java.yml --gateway $OPENFAAS_URL`{{execute}}


### Test the function
You can now test the function via the OpenFaaS UI portal, using Postman, the CLI or even curl.

echo -n "" | faas-cli invoke hello-java