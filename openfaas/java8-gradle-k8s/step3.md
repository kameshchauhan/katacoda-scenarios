### Build  the function
Now use the faas-cli to build the function, you will see gradle kick in and start downloading 
the dependencies it needs:

`faas-cli build -f hello-java.yml`{{execute}}

### Push the built image to Registry
In order to deploy the build image as function, push it to the container registry. The image
can be pushed to the Docker hub or a private registry deployed in the cluster. For this course,
we have deployed the private container registry in the cluster and can be accessed as below:
Now you can push the built image so that on deployment of the function, the required image will be pulled 
as part of kubernetes deployment.
`faas-cli push -f hello-java.yml`{{execute}}

The image can be seen in the container registry.

`curl $REGISTRY/v2/_catalog`{{execute}}

### Deploy the built function
Now that you have successfully pushed the image to Docker Hub, issue the
deployment to kubernetes and that will pull the image automatically.

`faas-cli deploy -f hello-java.yml`{{execute}}

### Test the function
You can now test the function via the OpenFaaS UI portal, using Postman, 
the CLI or even curl.

Open an OpenFaaS gateway and see all the deployed function to test each:

`echo $OPENFAAS_URL`{{execute}}

Or

`echo -n "" | faas-cli invoke hello-java`{{execute}}

Or

`echo $OPENFAAS_URL/function/hello-java`{{execute}}