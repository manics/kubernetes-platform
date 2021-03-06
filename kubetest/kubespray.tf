
module "network" {
  source = "kubespray/contrib/terraform/openstack/modules/network"

  external_net = "${var.external_net}"
  network_name = "${var.network_name}"
  cluster_name = "${var.cluster_name}"
  dns_nameservers = "${var.dns_nameservers}"
}


module "compute" {
  source = "kubespray/contrib/terraform/openstack/modules/compute"

  cluster_name = "${var.cluster_name}"
  number_of_k8s_masters = "${var.number_of_k8s_masters}"
  number_of_k8s_masters_no_etcd = "${var.number_of_k8s_masters_no_etcd}"
  number_of_etcd = "${var.number_of_etcd}"
  number_of_k8s_masters_no_floating_ip = "${var.number_of_k8s_masters_no_floating_ip}"
  number_of_k8s_masters_no_floating_ip_no_etcd = "${var.number_of_k8s_masters_no_floating_ip_no_etcd}"
  number_of_k8s_nodes = "${var.number_of_k8s_nodes}"
  number_of_bastions = "${var.number_of_bastions}"
  number_of_k8s_nodes_no_floating_ip = "${var.number_of_k8s_nodes_no_floating_ip}"
  number_of_gfs_nodes_no_floating_ip = "${var.number_of_gfs_nodes_no_floating_ip}"
  gfs_volume_size_in_gb = "${var.gfs_volume_size_in_gb}"
  public_key_path = "${var.public_key_path}"
  image = "${var.image}"
  image_gfs = "${var.image_gfs}"
  ssh_user = "${var.ssh_user}"
  ssh_user_gfs = "${var.ssh_user_gfs}"
  flavor_k8s_master = "${var.flavor_k8s_master}"
  flavor_k8s_node = "${var.flavor_k8s_node}"
  flavor_etcd = "${var.flavor_etcd}"
  flavor_gfs_node = "${var.flavor_gfs_node}"
  network_name = "${var.network_name}"
  flavor_bastion = "${var.flavor_bastion}"
  supplementary_master_groups = "${var.supplementary_master_groups}"
  k8s_master_fips = "${var.k8s_master_fips}"
  k8s_node_fips = []
  bastion_fips = []

  network_id = "${module.network.router_id}"
}

variable "k8s_master_fips" {
  default = []
}
