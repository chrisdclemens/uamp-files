#!/bin/bash
if [ -f '/etc/apache2/apache2.conf.default' ]; then
  echo 'Apache file already backed up to "/etc/apache2/apache2.conf.default"'
	echo 'Quiting'
	exit 0
fi 

if [ ! -f '/etc/apache2/apache2.conf.default' ]; then
  sudo cp -v '/etc/apache2/apache2.conf' '/etc/apache2/apache2.conf.default'
	echo 'Backing up apache.conf'
	echo '----------------------'
fi 
if [ -f '/etc/apache2/apache2.conf.default' ]; then
	echo 'Apache Configuration file copied /etc/apache2/apache2.conf.default'
fi 

