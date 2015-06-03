#!/bin/sh

PUPPET_DIR='/opt/puppet-provision'
VAGRANT_DIR='/vagrant'

if [ -d "$VAGRANT_DIR" ]; then
  rm -rf $PUPPET_DIR
fi

mkdir $PUPPET_DIR

cp -r $VAGRANT_DIR/* $PUPPET_DIR/

cd $PUPPET_DIR && librarian-puppet install --verbose

puppet apply -vv  --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/default.pp