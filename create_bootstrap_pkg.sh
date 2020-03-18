#!/bin/bash

set -eu -o pipefail

NAME=vm-bootstrap
VERSION=2019.11.26
IDENTIFIER_PREFIX=ca.macops

pkg_file_name="${NAME}-${VERSION}"
component_file="${pkg_file_name}_component.pkg"
# dist_file="${pkg_file_name}.pkg"
# just using a static name for now so as to not need to touch the template
dist_file="${NAME}.pkg"

# build it
pushd bootstrap_pkg
find . -name ".DS_Store" -print0 | xargs -0 rm -f
xattr -c -r .
pkgbuild \
	--root pkgroot \
	--scripts Scripts \
	--identifier "${IDENTIFIER_PREFIX}.${NAME}" \
	--version "${VERSION}" \
	"${component_file}"

productbuild \
	--package "${component_file}" \
	"${dist_file}"
rm -f "${component_file}"
popd

# staging this to packer's directory
rm -rf httpd && mkdir -p httpd
cp -v "bootstrap_pkg/${dist_file}" httpd/
