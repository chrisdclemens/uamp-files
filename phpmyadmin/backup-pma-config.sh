#!/bin/sh

export FN='/etc/phpmyadmin/config.inc.php_backup'

if [ ! -f $FN ]; then
  echo "Backing up current config.inc.php file to $FN"
  sudo cp -v /etc/phpmyadmin/config.inc.php $FN
  if [ -f $FN ]; then
    echo "[phpmyadmin setup] Config File Backed Up -> /etc/phpmyadmin/config.inc.php_backup"
	else
    echo 'Error: File not copied'
	fi
else
  if [ -f $FN ]; then
	echo "File already copied to $FN"
	ls /etc/phpmyadmin/
	exit 0
	fi
fi

unset FN
