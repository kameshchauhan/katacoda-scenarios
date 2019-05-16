You can create an OpenFaaS function using different languages of your choice. This is possible
by using the predefined templates for each project.


### Get the java template
Let's get all the template available from OpenFaaS template store.

`cd /root/openfaas/ && faas-cli template pull`{{execute}}

Now you can list all the templates you've downloaded like this:

`faas-cli new --list`{{execute}}


### Docker hub account
In order to deploy custom function to OpenFaaS, a Docker Hub username or private registry address
is required to store the images.

export your Docker Hub account as environment variable like below:
`export username=kameshc`{{execute}}
  
### Creating a new project
Now create a new function called "hello-java" by using below command

`faas-cli new --lang java8 hello-java --prefix=$username`{{execute}}

This generates several files:

**build.gradle** - specify any other JAR files or code repositories needed
**settings.gradle** - specify any other build settings needed
You then get a function Handler.java and HandlerTest.java file in the ./src folder.

Contents of ./hello-java/src/main/java/com/openfaas/function/Handler.java
<pre>
package com.openfaas.function;

import com.openfaas.model.IHandler;
import com.openfaas.model.IResponse;
import com.openfaas.model.IRequest;
import com.openfaas.model.Response;

public class Handler implements com.openfaas.model.IHandler {

    public IResponse Handle(IRequest req) {
        Response res = new Response();
	    res.setBody("Hello, world!");

	    return res;
    }
}

</pre>
