#Config: {
	versions: {...}
	private_registries?: {...}
	args?: {...}
	cloud_provider?: {...}
	network_config?: {...}
	dns_config?: {...}
	proxy_config?: {...}
	cluster_name: string
	kubernetes_version: string & =~"^v[0-9]+\\.[0-9]+\\.[0-9]+$"

	...
}

#Config: kubernetes_version: "v1.22.4"

#winkube_versions: {
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
	...
}


k8s_binaries: ["kube-apiserver", "kubelet", "kube-proxy", "kubectl"]
k8s_components: {
	for i, binary in k8s_binaries {
		"\(binary)": #binary & {
			name: "\(binary)"
			version: #winkube_versions.kubernetes
		}
	}
}


wins: #binary & {
	version: #winkube_versions.wins
	name: "wins"
	flags: ["-test"]
}


cri_tools: {
	#binary & {
		version: #winkube_versions.cri_tools
		name: "cri_tools"
     	flags: ["-test"]
	}
}


flannel: {
	#binary & {
		version: #winkube_versions.flannel
		name: "flannel"
    	flags: ["-test"]
	}
}

flannel_cni_plugin: {
	#binary & {
		version: #winkube_versions.cni_plugins
		name: "flannel_cni_plugin"
    	flags: ["-test"]
	}
}

kine: {
	#binary & {
		version: #winkube_versions.kine
		name: "kine"
    	flags: ["-test"]
	}
}

cni_plugins: {
	#binary & {
		version: #winkube_versions.cni_plugins
		name: "cni_plugins"
    	flags: ["-test"]
	}
}


sqllite: {
	#binary & {
		version: #winkube_versions.sqllite
		name: "sqllite"
    	flags: ["-test"]
	}
}


containerd: {
	#binary & {
		version: #winkube_versions.containerd
		name: "containerd"
    	flags: ["-test"]
	}
}



config: #Config & {
	versions: #winkube_versions
	cluster_name: "test-cluster"
	kubernetes_version: #winkube_versions.kubernetes
    private_registries: #registry_config
    args: #winkube_args
    cloud_provider: #winkube_cloud_provider
    network_config: #winkube_network_config
    dns_config: #winkube_dns_config
    proxy_config: #winkube_proxy_config
}
