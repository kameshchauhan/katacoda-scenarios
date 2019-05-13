The OpenFaaS environment is being prepared, wait for 2-3 minutes to let it up and you will 
see the OpenFaaS Gateway URL in the terminal aside. 

### OpenFaaS Design & Architecture
Below is the design and Architecture of OpenFaaS.

![OpenFaaS Architecture](https://docs.openfaas.com/images/of-conceptual-operator.png)

### Access the Kubernetes Dashboard
The kubernetes dashboard addon will be enabled in the environment to see the pods in action.
Access the dashboard at:

`echo $K8S_DASHBOARD`{{execute}}

### Access the OpenFaaS Gateway
Assess the below Gatway URL and login with `user/pass` as `admin/admin`. Once login you should be
able to see the dashboard and option to deploy sample function.  

`echo $OPENFAAS_URL`{{execute}}

The gateway will take a while to get started, so refresh the webpage (url returned by the previous
command) in a while to see if it is up.

### Deploy available sample function from store 
Click on deploy new function option and select `figlet` from the available list and click deploy.
Observe the status as `not ready` and in few minutes, it will become `ready`. Click the function
to invoke by providing any simple word like `Hello World` in the Request Body section and check 
the output.
Correct output confirms the correct working of OpenFaaS environment.

Proceed to next step to start creating your own function.