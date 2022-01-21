# metadata

winkube will be driven by configuration powered by this metadata repository.

## Cue Usage
the `./winkube` directory is a cue module and most operations should be done from there.

### Go Types
Metadata starts from the go types and generates cue types from them to help dynamically build config files for winkube.
If you update the go types in the root of the dir you can re-generate them for the winkube module by doing
the following

```
# generate ./winkube/cue.mod/gen/github.com/winkube/metadata/types_go_gen.cue
cd winkube
cue get go ../.
```

### Creating a new YAML file for a kubernetes release
Cue has a tag concept and there is a hidden version array in `./winkube/v121.cue` and `./winkube/v122.cue`. To tell
cue which versions array to use you can pass the tag you can find at the top of the file. There is additionally a required
tag of `version` which represents the kubernetes version and locks in those components to their respective version.

```
cd winkube
cue export -t v122 -t version="v1.22.1" --out yaml
```

To write the new YAML file out to the data dir simply do 

```
# 1.21.4
cue export -t version="v1.21.4" -t v121 --out yaml -o ./data/v1.21.4.yaml

# 1.22.1
cue export -t version="v1.22.1" -t v122 --out yaml -o ./data/v1.22.1.yaml
```