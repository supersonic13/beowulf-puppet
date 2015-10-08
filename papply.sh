#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $(dirname $(which puppet))
./puppet apply -d $DIR/puppet-applications/manifests/site.pp --modulepath=$DIR/puppet-tools/modules/
cd -
