import "encoding/yaml"
"v1.22.4.yaml":
yaml.Marshal({
#Config: {
	components: {...}
	private_registries?: {...}
	args?: {...}
	cloud_provider?: {...}
	network_config?: {...}
	dns_config?: {...}
	proxy_config?: {...}
	distro: string
	cluster_name: string
	version: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"

	...
}


#component_versions: {
	containerd: "v1.5.8"
	flannel: "v0.15.1"
	flannel_cni: "v1.0.0"
	kubernetes: "v1.22.4"
	wins: "v0.1.3"
	sqllite: "v3.32.2"
	cni_plugins: "v1.0.0"
	cri_tools: "v1.22.0"
	kine: "v1.0.0"
}

#registry_config: {

}

#winkube_args: {

}

#winkube_cloud_provider: {

}

#winkube_network_config: {

}

#winkube_dns_config: {

}

#winkube_proxy_config: {

}

#binary: {
	version: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"
	name: string
	flags: [...]
}

#kube_apiserver: #binary & {
	version: #component_versions.kubernetes
	name: "kube_apiserver"
	flags: ["--test", "--verbose"]
}

#kubelet: #binary & {
	version: #component_versions.kubernetes
	name: "kubelet"
	flags: ["--test", "--verbose"]
}

#kube_proxy: #binary & {
	version: #component_versions.kubernetes
	name: "kube_proxy"
	flags: ["--test", "--verbose"]
}

#kubectl: #binary & {
	version: #component_versions.kubernetes
	name: "kubectl"
	flags: ["--test", "--verbose"]
}

#wins: #binary & {
	version: #component_versions.wins
	name: "wins"
	flags: ["--test", "--verbose"]
}

#cri_tools: #binary & {
		version: #component_versions.cri_tools
		name: "cri_tools"
     	flags: ["--test", "--verbose"]
	}


#flannel: #binary & {
		version: #component_versions.flannel
		name: "flannel"
    	flags: ["--test", "--verbose"]
	}

#flannel_cni_plugin: #binary & {
		version: #component_versions.cni_plugins
		name: "flannel_cni_plugin"
    	flags: ["--test", "--verbose"]
	}

#kine: #binary & {
		version: #component_versions.kine
		name: "kine"
    	flags: ["--test", "--verbose"]
	}

#cni_plugins: #binary & {
		version: #component_versions.cni_plugins
		name: "cni_plugins"
    	flags: ["--test", "--verbose"]
	}


#sqllite: #binary & {
		version: #component_versions.sqllite
		name: "sqllite"
    	flags: ["--test", "--verbose"]
	}


#containerd: #binary & {
		version: #component_versions.containerd
		name: "containerd"
    	flags: ["--test", "--verbose"]
	}

#kubernetes: {
	kube_apiserver: #kube_apiserver
	kubelet: #kubelet
	kube_proxy: #kube_proxy
	kubectl: #kubectl
}

config: #Config & {
	components: {
		containerd: #containerd
		sqllite: #sqllite
		cni_plugins: #cni_plugins
		kine: #kine
		flannel_cni_plugin: #flannel_cni_plugin
		flannel: #flannel
		wins: #wins
		cri_tools: #cri_tools
		kubernetes: #kubernetes
	}
	cluster_name: "test-cluster"
	distro: "winkube"
	version: "v0.0.1"
	kubernetes: #component_versions.kubernetes
    private_registries: #registry_config
    args: #winkube_args
    cloud_provider: #winkube_cloud_provider
    network_config: #winkube_network_config
    dns_config: #winkube_dns_config
    proxy_config: #winkube_proxy_config
}
})