
export ISTIO_VERSION="1.1.3"
cd ~
mkdir istio
cd istio
curl -L https://git.io/getLatestIstio | ISTIO_VERSION sh -
export PATH=$PWD/bin:$PATH
export ISTIO_HOME=~/istio/istio-$ISTIO_VERSION
export NAMESPACE="istio"
cd istio-$ISTIO_VERSION

