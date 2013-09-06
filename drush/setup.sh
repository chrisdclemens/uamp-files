#!/bin/bash
#
# Installation instructions in README.txt 
# http://drupalcode.org/project/drush.git/blob_plain/HEAD:/README.txt
#

echo "Cloning Drush into $HOME"
git clone --recursive https://github.com/drush-ops/drush.git $HOME/drush > /dev/null

cd $HOME/drush
git co 6.x > /dev/null
sudo mv $HOME/drush /etc/drush

echo "Changing Permissions of '/etc/drush/drush.php'"
sudo chmod u+x /etc/drush/drush.php

sudo ln -s /etc/drush/drush.php /usr/bin/drush

echo '
===================================================================
Drush Install complete!
==================================================================='
'

exit 0
