### Build  the function
Now use the faas-cli to build the function, you will see gradle kick in and start downloading 
the dependencies it needs:

`faas-cli build -f hello-python3.yml`{{execute}}

### Push the built image to Container Registry
OpenFaaS requires a container registry during the build, push and deploy phases. It defaults to using Docker Hub, 
but there is no need to shuttle private images over the internet. Instead we keep all this pushing and pulling in 
a local registry.
In order to push the built image to Docker hub, login via docker cli is required using 
`docker login`

For this course we have used Private Docker Registry.

`faas-cli push -f hello-python3.yml`{{execute}}

The image can be seen in the container registry.

`curl $REGISTRY/v2/_catalog`{{execute}}

### Deploy the built function
Now that you have successfully pushed the image to Docker Hub, issue the
deployment to kubernetes and that will pull the image automatically.

`faas-cli deploy -f hello-python3.yml`{{execute}}

### Test the function
You can now test the function via the OpenFaaS UI portal, using Postman, 
the CLI or even curl.

Open an OpenFaaS gateway and see all the deployed function to test each:
When asked about credentials enter the `username/password` as `admin/admin`.

`echo $OPENFAAS_URL`{{execute}}

Or

`echo -n "Hello, Python3" | faas-cli invoke hello-python3`{{execute}}

