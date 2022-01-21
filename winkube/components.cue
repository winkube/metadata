package winkube

import "github.com/winkube/metadata"

#components: {[string]: metadata.#Component}

let kube_components = ["kube-apiserver", "kubelet", "kube-proxy"]
for _, v in kube_components {
	#components: "\(v)": metadata.#Component & {
		name: "\(v)"
		description: "container runtime engine"
		version: #version
		path: "C:\\etc\\winkube\\bin\\\(v)-\( #version ).exe"
	}
}

// components
#components: containerd: metadata.#Component & {
		name: "containerd"
		description: "container runtime engine"
		version: #component_versions.containerd
		path: "C:\\etc\\winkube\\bin\\containerd-\( #component_versions.containerd ).exe"
}

#components: flannel: metadata.#Component & {
		name: "flannel"
		description: "the flannel cni"
		version: #component_versions.flannel
		path: "C:\\etc\\winkube\\bin\\flannel-\( #component_versions.flannel ).exe"
}

#components: flannel_cni: metadata.#Component & {
		name: "flannel"
		description: "the flannel cni plugin"
		version: #component_versions.flannel_cni
		path: "C:\\etc\\winkube\\bin\\flannel-cni-\( #component_versions.flannel_cni ).exe"
}