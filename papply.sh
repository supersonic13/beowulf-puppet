#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $(dirname $(which puppet))
./puppet apply -d $DIR/puppet_applications/manifests/site.pp --modulepath=$DIR/puppet_tools/modules/
cd -
