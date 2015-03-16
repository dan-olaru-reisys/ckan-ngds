#!/usr/bin/env bash

yum update -y ca-certificates

cd /etc/yum.repos.d/
curl -fsLOS http://packages.reisys.com/ckan/ngds/libxml2.repo
curl -fsLOS http://packages.reisys.com/ckan/ngds/ngds.repo

rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh http://yum.postgresql.org/9.1/redhat/rhel-6.3-x86_64/pgdg-centos91-9.1-4.noarch.rpm
rpm -Uvh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

yum install -y libxml2-2.9.0 gdal-1.9.2 gdal-python-1.9.2 gdal-devel-1.9.2 yum-utils
yum-config-manager --disable pgdg93
yum install -y ngds.ckan

#if [ -d "/vagrant/src" ]; then
#  rm -rf /usr/lib/ckan/src
#  ln -s /vagrant/src /usr/lib/ckan/src
#else 
#  mv /usr/lib/ckan/src /vagrant
#  ln -s /vagrant/src /usr/lib/ckan/src
#fi
