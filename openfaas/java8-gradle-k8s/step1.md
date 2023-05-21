The OpenFaaS environment is being prepared, wait for 2-3 minutes to let it up and you will 
see the OpenFaaS Gateway URL in the terminal aside. 

### OpenFaaS Design & Architecture
Below is the design and Architecture of OpenFaaS.

![OpenFaaS Architecture](https://docs.openfaas.com/images/of-conceptual-operator.png)

### Access the OpenFaaS Gateway

To interact with OpenFaaS through its portal, access the OpenFaaS Gateway on the tab or from 
this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/

When asked about credentials enter the username as `admin` and password as revealed below:
`echo -e "The OpenFaaS portal will need these credentials when prompted:user: admin\password: $PASSWORD"`{{execute}}

Once login you should be able to see the dashboard and option to deploy function.
