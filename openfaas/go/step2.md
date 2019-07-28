You can create an OpenFaaS function using different languages of your choice. This is possible
by using the predefined templates for each project.


### Get the templates
Let's get all the template available from OpenFaaS template store.

`cd /root/openfaas/ && faas-cli template pull`{{execute}}

Now you can list all the templates you've downloaded like this:

`faas-cli new --list`{{execute}}

  
### Creating a new project
Now create a new function called "hello-go" by using below command

`faas-cli new --lang go hello-go --prefix $REGISTRY/hello-go --gateway $OPENFAAS_URL`{{execute}}

Contents of handler function is 
`/openfaas/hello-go/handler.go`{{open}}

<pre>
package function

import (
	"fmt"
)

// Handle a serverless request
func Handle(req []byte) string {
	return fmt.Sprintf("Hello, Go. You said: %s", string(req))
}

</pre>
