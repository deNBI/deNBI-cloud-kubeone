# KubeOne OpenStack Setup - de.NBI Cloud Bielefeld

This README is a modified version of the original README from the KubeOne repository. The original README can be found [here]().

The full documentation for KubeOne can be found [here](https://docs.kubermatic.com/kubeone/).
The version of KubeOne used in this repository is v1.8.0.

The OpenStack Quickstart Terraform configs can be used to create the needed
infrastructure for a Kubernetes HA cluster. Check out the following
[Creating Infrastructure guide][docs-infrastructure] to learn more about how to
use the configs and how to provision a Kubernetes cluster using KubeOne.

## Kubernetes API Server Load Balancing

See the [Terraform loadbalancers in examples document][docs-tf-loadbalancer].

[docs-infrastructure]: https://docs.kubermatic.com/kubeone/v1.8/guides/using-terraform-configs/
[docs-tf-loadbalancer]: https://docs.kubermatic.com/kubeone/v1.8/examples/ha-load-balancing/

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 1.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | ~> 1.52.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_compute_instance_v2.bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) | resource |
| [openstack_compute_instance_v2.control_plane](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_instance_v2) | resource |
| [openstack_compute_keypair_v2.deployer](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_keypair_v2) | resource |
| [openstack_lb_listener_v2.kube_apiserver](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/lb_listener_v2) | resource |
| [openstack_lb_loadbalancer_v2.kube_apiserver](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/lb_loadbalancer_v2) | resource |
| [openstack_lb_member_v2.kube_apiserver](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/lb_member_v2) | resource |
| [openstack_lb_monitor_v2.lb_monitor_tcp](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/lb_monitor_v2) | resource |
| [openstack_lb_pool_v2.kube_apiservers](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/lb_pool_v2) | resource |
| [openstack_networking_floatingip_associate_v2.bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_associate_v2) | resource |
| [openstack_networking_floatingip_associate_v2.kube_apiserver](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_associate_v2) | resource |
| [openstack_networking_floatingip_v2.bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_v2) | resource |
| [openstack_networking_floatingip_v2.kube_apiserver](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_floatingip_v2) | resource |
| [openstack_networking_network_v2.network](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_port_v2.bastion](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |
| [openstack_networking_port_v2.control_plane](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_port_v2) | resource |
| [openstack_networking_router_interface_v2.router_subnet_link](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_v2.router](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_v2) | resource |
| [openstack_networking_secgroup_rule_v2.nodeports](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.secgroup_allow_internal_ipv4](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.secgroup_apiserver](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.secgroup_ssh](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_v2.securitygroup](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |
| [openstack_networking_subnet_v2.subnet](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [openstack_images_image_v2.image](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/images_image_v2) | data source |
| [openstack_networking_network_v2.external_network](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/networking_network_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apiserver_alternative_names"></a> [apiserver\_alternative\_names](#input\_apiserver\_alternative\_names) | subject alternative names for the API Server signing cert. | `list(string)` | `[]` | no |
| <a name="input_bastion_flavor"></a> [bastion\_flavor](#input\_bastion\_flavor) | OpenStack instance flavor for the LoadBalancer node | `string` | `"m1.tiny"` | no |
| <a name="input_bastion_host_key"></a> [bastion\_host\_key](#input\_bastion\_host\_key) | Bastion SSH host public key | `string` | `null` | no |
| <a name="input_bastion_port"></a> [bastion\_port](#input\_bastion\_port) | Bastion SSH port | `number` | `22` | no |
| <a name="input_bastion_user"></a> [bastion\_user](#input\_bastion\_user) | Bastion SSH username | `string` | `"ubuntu"` | no |
| <a name="input_cluster_autoscaler_max_replicas"></a> [cluster\_autoscaler\_max\_replicas](#input\_cluster\_autoscaler\_max\_replicas) | maximum number of replicas per MachineDeployment (requires cluster-autoscaler) | `number` | `0` | no |
| <a name="input_cluster_autoscaler_min_replicas"></a> [cluster\_autoscaler\_min\_replicas](#input\_cluster\_autoscaler\_min\_replicas) | minimum number of replicas per MachineDeployment (requires cluster-autoscaler) | `number` | `0` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster | `string` | n/a | yes |
| <a name="input_control_plane_flavor"></a> [control\_plane\_flavor](#input\_control\_plane\_flavor) | OpenStack instance flavor for the control plane nodes | `string` | `"m1.small"` | no |
| <a name="input_control_plane_vm_count"></a> [control\_plane\_vm\_count](#input\_control\_plane\_vm\_count) | number of control plane instances | `number` | `3` | no |
| <a name="input_external_network_name"></a> [external\_network\_name](#input\_external\_network\_name) | OpenStack external network name | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | image name to use | `string` | `""` | no |
| <a name="input_image_properties_query"></a> [image\_properties\_query](#input\_image\_properties\_query) | in absence of var.image, this will be used to query API for the image | `map(any)` | <pre>{<br>  "os_distro": "ubuntu",<br>  "os_version": "22.04"<br>}</pre> | no |
| <a name="input_initial_machinedeployment_operating_system_profile"></a> [initial\_machinedeployment\_operating\_system\_profile](#input\_initial\_machinedeployment\_operating\_system\_profile) | Name of operating system profile for MachineDeployments, only applicable if operating-system-manager addon is enabled.<br>If not specified, the default value will be added by machine-controller addon. | `string` | `""` | no |
| <a name="input_initial_machinedeployment_replicas"></a> [initial\_machinedeployment\_replicas](#input\_initial\_machinedeployment\_replicas) | Number of replicas per MachineDeployment | `number` | `2` | no |
| <a name="input_ssh_agent_socket"></a> [ssh\_agent\_socket](#input\_ssh\_agent\_socket) | SSH Agent socket, default to grab from $SSH\_AUTH\_SOCK | `string` | `"env:SSH_AUTH_SOCK"` | no |
| <a name="input_ssh_hosts_keys"></a> [ssh\_hosts\_keys](#input\_ssh\_hosts\_keys) | A list of SSH hosts public keys to verify | `list(string)` | `null` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | SSH port to be used to provision instances | `number` | `22` | no |
| <a name="input_ssh_private_key_file"></a> [ssh\_private\_key\_file](#input\_ssh\_private\_key\_file) | SSH private key file used to access instances | `string` | `""` | no |
| <a name="input_ssh_public_key_file"></a> [ssh\_public\_key\_file](#input\_ssh\_public\_key\_file) | SSH public key file | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | SSH user, used only in output | `string` | `"ubuntu"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | OpenStack subnet cidr | `string` | `"192.168.1.0/24"` | no |
| <a name="input_subnet_dns_servers"></a> [subnet\_dns\_servers](#input\_subnet\_dns\_servers) | n/a | `list(string)` | <pre>[<br>  "8.8.8.8",<br>  "8.8.4.4"<br>]</pre> | no |
| <a name="input_worker_flavor"></a> [worker\_flavor](#input\_worker\_flavor) | OpenStack instance flavor for the worker nodes | `string` | `"m1.small"` | no |
| <a name="input_worker_os"></a> [worker\_os](#input\_worker\_os) | OS to run on worker machines | `string` | `"ubuntu"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeone_api"></a> [kubeone\_api](#output\_kubeone\_api) | kube-apiserver LB endpoint |
| <a name="output_kubeone_hosts"></a> [kubeone\_hosts](#output\_kubeone\_hosts) | Control plane endpoints to SSH to |
| <a name="output_kubeone_workers"></a> [kubeone\_workers](#output\_kubeone\_workers) | Workers definitions, that will be transformed into MachineDeployment object |
| <a name="output_ssh_commands"></a> [ssh\_commands](#output\_ssh\_commands) | n/a |


## Adaptations for the de.NBI Cloud Bielefeld

The [original KubeOne Terraform configuration files](https://github.com/kubermatic/kubeone/tree/main/examples/terraform/openstack) have been adapted to work with the de.NBI Cloud Bielefeld. The following changes have been made:

1. The OpenStack provider has been configured to use the de.NBI Cloud Bielefeld Keystone authentication endpoint.
2. The Router definition has been adapted to use the de.NBI Cloud Bielefeld fixed router per project convention. The fixed router is created by the de.NBI Cloud Bielefeld team and is available in every project. The router name can be configured in the `terraform.tfvars` file using the `router_name` variable.
3. Due to the de.NBI Cloud Bielefeld network setup, the `subnet_cidr` variable has been set to a value in the `192.168.` range.
4. The `external_network_name` variable has been set to the de.NBI Cloud Bielefeld external network name `external`.
5. The `image` variable has been set to the latest de.NBI Cloud Bielefeld Ubuntu 24.04 image name `Ubuntu 24.04 LTS (2024-07-03)`. Please check the de.NBI Cloud Bielefeld Horizon dashboard for the latest image name.
6. The `bastion_flavor`, `control_plane_flavor`, and `worker_flavor` variables have been set to the de.NBI Cloud Bielefeld flavors `de.NBI tiny`, `de.NBI default`, and `de.NBI mini` respectively. You can check the de.NBI Cloud Bielefeld Horizon dashboard for the latest flavor names. Please adapt the flavor names according to your requirements.
7. The `control_plane_vm_count` variable has been set to `3` to create a 3-node control plane in HA mode.
8. The load balancer configuration has been adapted to route traffic to the control plane nodes. The load balancer listens on port `6443` and forwards traffic to the control plane nodes on port `6443`. For ssh access to the Kubernetes cluster, the load balancer listens on port `22` and forwards traffic to the bastion node on port `22`. Please adapt the load balancer configuration according to your requirements. If you plan to deploy externally available services, you should add additional listeners and pools to the load balancer configuration, e.g. for port `443` (https).

### Setting up OpenStack API Authentication

To authenticate with the de.NBI Cloud Bielefeld OpenStack API, you need log in to the Horizon Dashboard and create new API credentials. The following steps describe how to create new API credentials:

1. Log in to the [de.NBI Cloud Bielefeld Horizon Dashboard](https://openstack.cebitec.uni-bielefeld.de).
2. Select your project.
3. Go to `Identity` -> `Application Credentials`.
4. Click on `Create Application Credential` and enter your project name for the `Name` field. You can leave the `Description` field empty. If you want to limit the lifetime of the credentials, you can set an expiration date. 
5. Click on `Create Application Credential` and download the `clouds.yaml` file. You will need the values contained in it to configure access to the de.NBI Cloud Bielefeld OpenStack API.
6. Create the `env.sh` file in this directory for use with Terraform and copy the values from the `clouds.yaml` file into it, replacing the placeholders. The `env.sh` file should look like this:

```bash
#!/bin/bash
OS_AUTH_URL=https://openstack.cebitec.uni-bielefeld.de:5000
OS_APPLICATION_CREDENTIAL_ID=<REPLACE-WITH-YOUR-CREDENTIAL-ID>
OS_APPLICATION_CREDENTIAL_SECRET=<REPLACE-WITH-YOUR-SECRET>
OS_AUTH_TYPE=v3applicationcredential
OS_REGION_NAME=Bielefeld
```
7. Source the `env.sh` file to set the environment variables:

```bash
source env.sh
```
8. Create the `credentials.yaml` file for use with the `kubeone` command in this directory and copy the values from the `clouds.yaml` file into it, replacing the placeholders. The `credentials.yaml` file should look like this:

```yaml
OS_AUTH_URL: https://openstack.cebitec.uni-bielefeld.de:5000
OS_APPLICATION_CREDENTIAL_ID: <REPLACE-WITH-YOUR-CREDENTIAL-ID>
OS_APPLICATION_CREDENTIAL_SECRET: <REPLACE-WITH-YOUR-SECRET>
OS_AUTH_TYPE: v3applicationcredential
OS_REGION_NAME: Bielefeld
```

### Setting up the Terraform configuration

1. Install KubeOne, Terraform and the OpenStack provider. You can find the installation instructions [here](https://docs.kubermatic.com/kubeone/v1.8/tutorials/creating-clusters/). 
2. Run `terraform init` to initialize the Terraform configuration.
3. Create the `terraform.tfvars` file in this directory and set the required variables. The `terraform.tfvars` file should look like this:

```hcl
# set the Kubernetes cluster name (alphanumerical, lowercase and - separated)
cluster_name = "<CLUSTER-NAME>"
# this needs to be a valid OpenStack router name
# the Bielefeld cloud uses the following naming convention: <project_name>_router
# the Router is created by the cloud operator and can not be created by the user
router_name = "<OPENSTACK_PROJECT_NAME>_router"
# replace with your SSH public key file
ssh_public_key_file = "~/.ssh/id.pub"
# leave as is
external_network_name = "external"
# adapt to your requirements or leave as is
subnet_cidr = "192.168.33.0/24"
# adapt to your requirements or leave as is
image = "Ubuntu 24.04 LTS (2024-07-03)"
# adapt to your requirements or leave as is
bastion_flavor = "de.NBI tiny"
# adapt to your requirements or leave as is
control_plane_flavor = "de.NBI default"
# adapt to your requirements or leave as is
control_plane_vm_count = 3
# adapt to your requirements or leave as is
worker_flavor = "de.NBI mini"
```
4. Run `terraform plan` to check the Terraform configuration.
5. Run `terraform apply` to create the infrastructure if the plan shows no errors and corresponds to your planned changes.
6. Save the Terraform state file in a secure location: `terraform output -json > tf.json`
7. Create the KubeOne configuration file `kubeone.yaml` in this directory and set the required variables. Adapt as necessary, check the terraform output or the OpenStack Dashboard to retrieve the LoadBalancer subnet-id and replace it. Additionally, since we will enable the default-storage-class addon, which will create a standard and cinder-csi storage class for OpenStack. The `kubeone.yaml` file should look like this:

```yaml
apiVersion: kubeone.k8c.io/v1beta2
kind: KubeOneCluster
versions:
  kubernetes: '1.29.4'
cloudProvider:
  openstack: {}
  external: true
  cloudConfig: |
    [Global]
    auth-url=https://openstack.cebitec.uni-bielefeld.de:5000
    application-credential-id=<REPLACE-WITH-YOUR-CREDENTIAL-ID>
    application-credential-secret=<REPLACE-WITH-YOUR-SECRET>

    [LoadBalancer]
    subnet-id=<REPLACE-WITH-YOUR-LOAD-BALANCER-SUBNET-ID>

addons:
  enable: true
  addons:
  #- name: unattended-upgrades
  # default-storage-class adds cloud provider specific storage drivers and classes  
  - name: default-storage-class
```
8. Run `kubeone apply -m kubeone.yaml -t tf.json -c credentials.yaml` to provision the Kubernetes cluster.
9. The command will show you the steps to provision the cluster. Enter `yes` to confirm the changes and proceed.
10. After the command has finished, you can access the Kubernetes cluster using the `kubeconfig` file that has been created in the current directory. You can use the `kubectl` (if it is installed) command to interact with the cluster:
```bash
export KUBECONFIG=$PWD/<cluster_name>-kubeconfig
kubectl get nodes
```

### Installing the Kubernetes Dashboard

For the next steps and for deploying applications to the Kubernetes cluster, we will use Helm. You can find the installation instructions for Helm [here](https://helm.sh/docs/intro/install/).
We will use Helm to install the Kubernetes Dashboard and the Kubernetes Dashboard Ingress.

1. Add the Kubernetes Dashboard repository and Helm charts to our local Helm installation using the following command:
```bash
helm --kubeconfig=eoc2024-cluster-kubeconfig repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
```
2. Then, install the Kubernetes Dashboard Ingress using the following command:
```bash
helm --kubeconfig=eoc2024-cluster-kubeconfig upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
```
3. The Kubernetes Dashboard Ingress will be installed in the `kubernetes-dashboard` namespace. You can check the status of the installation using the following command:
```bash
kubectl --kubeconfig=eoc2024-cluster-kubeconfig get all -n kubernetes-dashboard
```
4. To access the dashboard locally, add a port-forward to the Kubernetes Dashboard service using the following command:
```bash
kubectl --kubeconfig=eoc2024-cluster-kubeconfig -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```
5. We now need to add a service account and a cluster role binding to access the Kubernetes Dashboard. You can create the `dashboard-user` service account and the cluster-admin role binding using the following commands:
```bash
kubectl --kubeconfig=eoc2024-cluster-kubeconfig -n kubernetes-dashboard create serviceaccount dashboard-user
kubectl --kubeconfig=eoc2024-cluster-kubeconfig -n kubernetes-dashboard create clusterrolebinding dashboard-user --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:dashboard-user
```
6. In order to access the Dashboard, you will need to generate a token for the `dashboard-user` service account to authenticate. You can create the tokens using the following commands:
```bash
kubectl --kubeconfig=eoc2024-cluster-kubeconfig -n kubernetes-dashboard create token dashboard-user
```
Take note of the token generated for the `dashboard-user` service account. You can use the token to authenticate with the Kubernetes Dashboard. Please note that the token has a limited lifetime and will expire after a certain period. You can create a new token using the same command.

7. You can now access the Kubernetes Dashboard in your browser at `https://localhost:8443` using the token for the `dashboard-user` service account.

### Setting up NGINX Ingress Controller and Cert-Manager

Our charts directory contains the Helm charts for the NGINX Ingress Controller and Cert-Manager, derived from KubeOne's charts. You can download the charts using the `get-kubeone-charts.sh` script in the `terraform` directory.

```bash
./get-kubeone-charts.sh
```

The downloaded charts will be stored in the `charts-kubeone` directory.
For newer versions of the Helm charts, please compare the charts in the `charts-kubeone` directory with the charts in the `charts` directory and update the charts accordingly.

Before we can deploy both charts, we need to create custom configuration files for the NGINX Ingress Controller and Cert-Manager. The configuration files are stored in the `charts/nginx-ingress-controller` and `charts/cert-manager` directories respectively.
Copy the `chars/cert-manager/cluster-issuer.yaml.tmpl` file to `charts/cert-manager/cluster-issuer.yaml` and replace the placeholders with your email address. Make sure to retain the enclosing curly braces `{}`.

```yaml
...
    email: {replace-with-your-email@test}
...
```

Please also ensure that you have set up the DNS records for the domain you want to use with the NGINX Ingress Controller and Cert-Manager and that they point to the OpenStack load balancer IP address.


To deploy applications to the Kubernetes cluster, we will use the NGINX Ingress Controller and Cert-Manager. We will use Helm to install the NGINX Ingress Controller and Cert-Manager.

Use the following commands to install the NGINX Ingress Controller and Cert-Manager from the local `charts` directory:

```bash
helm --kubeconfig=eoc2024-cluster-kubeconfig --namespace kube-system upgrade --install nginx-ingress ./charts/nginx-ingress-controller
helm --kubeconfig=eoc2024-cluster-kubeconfig --namespace kube-system upgrade --install cert-manager ./charts/cert-manager
```

After the installation, we continue with the deployment of TESK.
Please clone the TESK repository and follow the deployment instructions in the `tesk/README.md` file.

```bash
git clone https://github.com/elixir-cloud-aai/TESK.git
```

Change to the `TESK` directory edit the `values.yaml` file in the `charts/tesk` directory and set the following values:

`host_name` - The hostname for the TESK service. This should be the domain name you have set up for the NGINX Ingress Controller. E.g. `tesk.example.com`.

`storage` - The storage to use for TESK. Set this to 'openstack' to use TESK with the OpenStack Cinder CSI driver. Otherwise, you should set this to 'S3'. Please consult the TESK documentation for more information.

Under `auth`, make sure that `mode` is set to `auth`. Please adapt other settings according to the TESK documentation.

If `auth` is set, you also need to set the `auth.client_id` and `auth.client_secret` to use OIDC authentication. These settings must match with existing OIDC settings for a Life Science AAI OIDC client.
Please check the LS AAI OIDC documentation for more information: https://lifescience-ri.eu/ls-login/relying-parties/how-to-register-and-integrate-a-relying-party-to-ls-login.html

Under `ingress`, set the `ingressClassName` to `"nginx"` to use the NGINX Ingress Controller we created earlier.

Also under `ingress`, set the `tls_secret_name` to `tesk-tls`.

Also under `ingress`, set the `annotations.cert-manager.io/cluster-issuer` to `letsencrypt-prod`.

Lastly, create a `secrets.yaml` file in the `charts/tesk` directory, add the following keys and replace the placeholders with the correct values:

```yaml
 ftp:
   username: replace-with-ftp-username
   password: replace-with-ftp-password

 auth:
   client_id: replace-with-ls-aai-oidc-client-id
   client_secret: replace-with-ls-aai-oidc-client-secret

```
You can now deploy TESK using the following command:

```bash
helm --kubeconfig=eoc2024-cluster-kubeconfig --namespace tesk upgrade --install tesk ./charts/tesk -f secrets.yaml
```
If you have set up the DNS records correctly, you should be able to access TESK at the hostname you have set up for the NGINX Ingress Controller. E.g. if you have set up `tesk.example.com` as the hostname, you should be able to access TESK at `https://tesk.example.com`. The website should be secured with a valid Let's Encrypt certificate and will redirect to the Swagger UI displaying the TESK API documentation.

Congratulations! You have successfully set up a Kubernetes cluster on the de.NBI Cloud Bielefeld and deployed TESK. You can now use TESK to run tasks on your Kubernetes cluster. Please consult the TESK documentation for more information on how to use TESK!