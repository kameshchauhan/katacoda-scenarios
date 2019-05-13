Check that the installed OpenFaaS environment is working as expected.

### OpenFaaS Design & Architecture
Below is the design and Architecture of OpenFaaS.

![OpenFaaS Architecture](https://docs.openfaas.com/images/of-conceptual-operator.png)

### Access the OpenFaaS Gateway
Assess the below Gatway URL and login with `user/pass` as `admin/admin`. Once login you should be
able to see the dashboard and option to deploy sample function.
[OpenFaaS Gateway]([OPENFAAS_URL])

### Deploy available sample function from store 
Click on deploy new function option and select "figlet" from the available list and click deploy.
Observe the status as "not ready" and in few minutes, it will become "ready". Click the function
to invoke by providing any simple word like "Hello World" in the Request Body section and check 
the output.
Correct output confirms the correct working of OpenFaaS environment.

Proceed to next step to start creating your own function.