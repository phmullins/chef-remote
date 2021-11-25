#!/bin/bash

# This runs as root on the server

chef_binary=/usr/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    export DEBIAN_FRONTEND=noninteractive
    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    aptitude update &&
    apt-get -o Dpkg::Options::="--force-confnew" \
        --force-yes -fuy dist-upgrade &&
    # Install Ruby and Chef
    aptitude install -y ruby2.1 ruby2.1-dev rubygems make &&
    curl -L https://www.opscode.com/chef/install.sh | bash
fi &&

"$chef_binary" -c solo.rb -j solo.json
