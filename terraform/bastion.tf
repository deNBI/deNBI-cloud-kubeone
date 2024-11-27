/*
Copyright 2019 The KubeOne Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

resource "openstack_networking_port_v2" "bastion" {
  name               = "${var.cluster_name}-bastion"
  admin_state_up     = "true"
  network_id         = openstack_networking_network_v2.network.id
  security_group_ids = [openstack_networking_secgroup_v2.securitygroup.id]

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet.id
  }
}

resource "openstack_compute_instance_v2" "bastion" {
  name            = "${var.cluster_name}-bastion"
  image_name      = data.openstack_images_image_v2.image.name
  flavor_name     = var.bastion_flavor
  key_pair        = openstack_compute_keypair_v2.deployer.name
  security_groups = [openstack_networking_secgroup_v2.securitygroup.name]

  network {
    port = openstack_networking_port_v2.bastion.id
  }
}

resource "openstack_networking_floatingip_v2" "bastion" {
  pool = var.external_network_name
}

resource "openstack_networking_floatingip_associate_v2" "bastion" {
  floating_ip = openstack_networking_floatingip_v2.bastion.address
  port_id     = openstack_networking_port_v2.bastion.id
}

resource "openstack_lb_pool_v2" "kube_bastion" {
  name            = "${var.cluster_name}-kube-bastion"
  protocol        = "TCP"
  lb_method       = "ROUND_ROBIN"
  loadbalancer_id = openstack_lb_loadbalancer_v2.kube_apiserver.id
  persistence {
    type = "SOURCE_IP"
  }
}

resource "openstack_lb_listener_v2" "kube_bastion" {
  name            = "${var.cluster_name}-kube-bastion"
  protocol        = "TCP"
  protocol_port   = 22
  admin_state_up  = true
  default_pool_id = openstack_lb_pool_v2.kube_bastion.id
  loadbalancer_id = openstack_lb_loadbalancer_v2.kube_apiserver.id
}

resource "openstack_lb_monitor_v2" "lb_monitor_ssh" {
  name        = "${var.cluster_name}-kube-bastion"
  pool_id     = openstack_lb_pool_v2.kube_bastion.id
  type        = "TCP"
  delay       = 30
  timeout     = 60
  max_retries = 10
}

resource "openstack_lb_member_v2" "bastion" {
  name          = "${var.cluster_name}-kube_bastion-${openstack_compute_instance_v2.bastion.access_ip_v4}"
  pool_id       = openstack_lb_pool_v2.kube_bastion.id
  address       = openstack_compute_instance_v2.bastion.access_ip_v4
  protocol_port = 22
}
