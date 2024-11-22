# AWX Operator on Kind

## Kind Install

Install Kind by running the following. Refer to the [official Kind documentation](https://kind.sigs.k8s.io/docs/user/quick-start/) for more information.

### Create the Kind cluster

Create a file called `kind.config`

```yaml
apiVersion: kind.x-k8s.io/v1alpha4
kind: Cluster
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 32000
    hostPort: 32000
    listenAddress: "0.0.0.0" # Optional, defaults to "0.0.0.0"
    protocol: tcp # Optional, defaults to tcp
- role: worker
```

Then create a cluster using that config

```sh
kind create cluster --config=kind.config
```

Set cluster context for kubectl

```sh
kubectl cluster-info --context kind-kind
```

Install NGINX Ingress Controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

Clone and Checkout the tag you want to install from

```sh
git clone https://github.com/ansible/awx-operator.git
git tags
```

Checkout the tag you want to install from

```sh
git checkout 2.7.2
```

Create a file named `kustomization.yaml` in the root of your local awx-operator clone. Include the following:

```sh
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: awx
resources:
  - github.com/ansible/awx-operator/config/default?ref=2.7.2

images:
  - name: quay.io/ansible/awx-operator
    newTag: 2.7.2

```

Run the following to apply the yaml

```sh
kubectl apply -k .
```

Create a file called `awx.yaml` with the following contents and any configuration changes you may wish to add.

```yaml
---
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx
spec:
  service_type: nodeport
  nodeport_port: 32000
```

Create your AWX

```sh
kubectl create -f awx.yaml
```

Your AWX instance should now be reachable at <http://localhost:32000/>

!!! note
    If you configured a custom `nodeport_port`, you can find it by running `kubectl -n awx get svc awx-demo-service`

## Cleanup

When you are done, you can delete all of this by running

```sh
kind delete cluster
```