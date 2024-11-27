# de.NBI Cloud KubeONE Kubernetes Deployment Guide

This guide will help you to deploy a Kubernetes cluster on the de.NBI Cloud using Kubermatic's KubeOne Kubernetes distribution.

## Prerequisites

- A de.NBI Cloud account and OpenStack project. See the [de.NBI Cloud documentation](https://cloud.denbi.de/get-started) for more information.
- A local machine with the following software installed:
  - [Terraform](https://www.terraform.io/downloads.html)
  - [KubeOne](https://docs.kubermatic.com/kubeone)

Please follow the installation instructions for Terraform and KubeOne on the respective websites. 
This KubeOne deployment follows the [official KubeOne documentation](https://docs.kubermatic.com/kubeone) with some adaptations of the Terraform scripts for the de.NBI Cloud.

## Deployment

1. Clone this repository to your local machine:

```bash
git clone https://github.com/deNBI/deNBI-cloud-kubeone.git
cd deNBI-cloud-kubeone
```

2. Open the [terraform/README.md](terraform/README.md) file and follow the instructions to create the necessary Terraform configuration files.

## License

This project is licensed under the Creative Commons Attribution 4.0 International License - see the [LICENSE](LICENSE) file for details.