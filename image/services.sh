#!/bin/bash
set -e
source /build/buildconfig
set -x

## Installing mariadb
$minimal_apt_get_install mariadb-server-${MARIADB_VERSION}
sed -ri 's/^(bind-address|skip-networking)/;\1/' /etc/mysql/my.cnf
rm -rf /var/lib/mysql/*

## Mysql configuration
cp /build/config/my.cnf /etc/mysql/
cp /build/config/mariadb.cnf /etc/mysql/conf.d/

## Setting up mysql service
mkdir /etc/service/mysqld_safe
cp /build/runit/mysqld_safe /etc/service/mysqld_safe/run