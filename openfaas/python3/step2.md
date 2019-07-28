You can create an OpenFaaS function using different languages of your choice. This is possible
by using the predefined templates for each project.


### Get the templates
Let's get all the template available from OpenFaaS template store.

`cd /root/openfaas/ && faas-cli template pull`{{execute}}

Now you can list all the templates you've downloaded like this:

`faas-cli new --list`{{execute}}

  
### Creating a new project
Now create a new function called "hello-python3" by using below command

`faas-cli new --lang python3 hello-python3 --prefix $REGISTRY/hello-python3 --gateway $OPENFAAS_URL`{{execute}}

Contents of handler function is 
`/openfaas/hello-python3/handler.py`{{open}}

<pre>
def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """

    return req
</pre>
