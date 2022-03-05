install_metallb_dep:
	helm repo add metallb https://metallb.github.io/metallb
	
install_metallb:
	helm install metallb metallb/metallb -f metallb_values.yaml


install_cert_dep:
	helm repo add jetstack https://charts.jetstack.io
	helm repo update

install_cert2:
	helm install \
		cert-manager jetstack/cert-manager \
		--namespace cert-manager \
		--create-namespace \
		--version v1.7.1 \
		--values cert_values.yaml

install_cert1:
	kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml

install_ingress_dep1:
	kubectl create ns echo2-namespace

install_ingress_dep2:
	helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

install_ingress:
	helm upgrade --install --create-namespace --namespace ingress-rules ingress-rules k8s
