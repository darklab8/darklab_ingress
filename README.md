# description

exposing multiple k8s resources in one multi domain/subpath entrance from 80/443 ports

# features

* ingress-nginx
* with metallb to work in microk8s
* letsencrypt for free ssl certificates
* and external services, to expose k8s objects from other namespaces

# instruction
python3 install.py --ip="ipv4_address"