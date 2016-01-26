#!/bin/bash

apt-get -y update

# install couchdb
# install the ppa-finding tool
# for 12.04 release
apt-get install python-software-properties -y
# for 14.04 release
apt-get install software-properties-common -y
# add the ppa
add-apt-repository ppa:couchdb/stable -y
# update cached list of packages
apt-get -y update
# remove any existing couchdb binaries
apt-get remove couchdb couchdb-bin couchdb-common -yf
# see my shiny goodness - note the version number displayed and ensure its what you expect
apt-get -y --force-yes install couchdb

# manage via upstart
stop couchdb

# update /etc/couchdb/local.ini with 'bind_address=0.0.0.0' as needed and our config
cp -r /vagrant/config/local.ini /etc/couchdb/local.ini

start couchdb

