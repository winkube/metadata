//go:build mage
// +build mage

/*
Copyright 2022 winkube and Contributors.
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

package main

import (
	"fmt"
	"os/exec"

	"github.com/magefile/mage/mg"
)

func Build() error {
	mg.Deps(InstallDeps)
	fmt.Println("Building...")
	cmd := exec.Command("cue", "get", "go", ".")
	return cmd.Run()
}

func InstallDeps() error {
	fmt.Println("Installing Deps...")
	installs := []string{
		"cuelang.org/go/cmd/cue@latest",
	}

	for _, pkg := range installs {
		fmt.Printf("Installing %s\n", pkg)
		cmd := exec.Command("go", "install", pkg)
		if err := cmd.Run(); err != nil {
			return err
		}
	}

	return nil
}
