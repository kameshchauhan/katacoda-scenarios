Clone the Git repository for demo script and application code
`cd /root/istio
git clone https://github.com/kameshchauhan/scripts-istio.git
git clone https://github.com/redhat-developer-demos/istio-tutorial.git
cd scripts-istio
`{{execute}}


Deploy the application customer, preferences v1 and recommendation v1
`./04-1_deploy_microservices.sh`{{execute}}

Now you can see the traffic
`./poll_customer.sh`{{execute }}

Build, package and deploy microservices
`./04-2_deploy_recommendationv2.sh`{{execute}}


Modify to create version v2 of the recommendation service
`cp RecommendationController.java ../istio-tutorial/recommendation/java/springboot/src/main/java/com/redhat/developer/demos/recommendation/`{{execute}}


Build, package & deploy the modified version v2 of recommendation service
`./04-2_deploy_recommendationv2.sh`{{execute}}




### Setup telemetry

Patch the different addon services to nodeport
`./02-1_patchServicesToNodePort.sh
./02-2_setupKiali.sh`{{execute}}


