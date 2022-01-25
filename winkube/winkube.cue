package winkube

import "github.com/winkube/metadata"

#version: string @tag(version)

#metadata: metadata.#Metadata & {
	version: #version
	components: #components
}

// drops the not level key for a flat file for yaml marshalling back into go
for k, v in #metadata {
    "\(k)": v
}