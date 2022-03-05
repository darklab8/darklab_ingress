install_ingress:
	helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

install_metallb_dep:
	helm repo add metallb https://metallb.github.io/metallb
	
install_metallb:
	helm install metallb metallb/metallb -f metallb_values.yaml


install_test_dep:
	kubectl create ns echo2-namespace

install_test:
	helm upgrade --install --create-namespace --namespace ingress-rules ingress-rules k8s
