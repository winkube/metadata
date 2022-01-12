#Config: {
	versions: {...}
	private_registries?: {...}
	extra_args?: {...}
	cloud_provider?: {...}
	network_config?: {...}
	dns_config?: {...}
	proxy_config?: {...}
	cluster_name: string
	kubernetes_version: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"

	...
}

#winkube_versions: {
	containerd: "1.5.8"
	flannel: "0.15.1"
	flannel_cni: "1.0.0"
	kubelet: "1.22.4"
	kube_proxy: "1.22.4"
	wins: "0.1.3"
}

#registry_config: {

}

#winkube_extra_args: {

}

#winkube_cloud_provider: {

}

#winkube_network_config: {

}

#winkube_dns_config: {

}

#winkube_proxy_config: {

}

config: #Config & {
	versions: #winkube_versions
	cluster_name: "test-cluster"
	kubernetes_version: "v1.22.4"
    private_registries: #registry_config
    extra_args: #winkube_extra_args
    cloud_provider: #winkube_cloud_provider
    network_config: #winkube_network_config
    dns_config: #winkube_dns_config
    proxy_config: #winkube_proxy_config
}
