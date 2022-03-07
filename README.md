I am deploying in baremetall microk8s

# Deploying MetalLB (Skip if you have loadbalancers in your managed k8s, it is needed only for baremetal k8s)

make install_metallb_dep
install_metallb

# Deploying cert-manager lets encrypt

install_cert_dep
install_cert1
install_cert2

# Deploying ingress

make install_ingress_dep1
make install_ingress_dep2
make install_ingress

## warning, my ingress exposes multiple services of my homelab, which you probably don't have

## warning #2, perhaps MetalLB probably deployed into specifically named namespace for this, I did not specify it in makefile