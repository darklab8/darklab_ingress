import os
import argparse
import time

def pause():
  print("sleep 2 seconds")
  time.sleep(2)

def shell(cmd):
  print(cmd)
  status_code = os.system(cmd)
  
  if status_code != 0:
      exit(status_code)

my_parser = argparse.ArgumentParser(description='')

my_parser.add_argument('--ip',
                       type=str)
my_parser.add_argument('--update',
                       type=bool)

args = my_parser.parse_args()

template = f"""
metallb:
  configInline:
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - {args.ip}/32
"""

with open(f"metallb/values.yaml", "w") as file_:
    file_.write(template)

# kubectl apply -f  https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml
shell(f'kubectl apply -f cert-manager.crds.yaml')
pause()
packages = ["cert-manager", "metallb", "ingress-nginx", "ingress-rules"]

if args.update:
  for package in packages:
    shell(f'helm dependency update {package}')
    pause()

for package in packages:
  shell(f'helm upgrade --install --create-namespace --namespace {package} {package} {package}')
  pause()

print("done!")