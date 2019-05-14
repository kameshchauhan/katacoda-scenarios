The OpenFaaS environment is being prepared, wait for 2-3 minutes to let it up and you will 
see the OpenFaaS Gateway URL in the terminal aside. 

### OpenFaaS Design & Architecture
Below is the design and Architecture of OpenFaaS.

![OpenFaaS Architecture](https://docs.openfaas.com/images/of-conceptual-operator.png)

Kubernetes Dashboard
As an administrator, you can control the cluster with the kubectl CLI tool. You can also use the Kubernetes Dashboard. 
Because the dashboard can be accessed publicly, it is protected and requires the secret access token to sign in. 
Because you have administration access to this cluster, copy the token from this secret.

`export TOKEN=$(kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}') && echo -e "\n--- Copy and paste this token for dashboard access --\n$TOKEN\n---"`{{execute}}

To access the dashboard, click on the Kubernetes Dashboard tab above the command line or from this link: 
https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. 
At the sign in prompt select Token and paste in the token, you copied a moment ago.

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