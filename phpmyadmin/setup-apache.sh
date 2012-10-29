#!/bin/sh
export PATH_A2=/etc/apache2/apache2.conf
echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf
