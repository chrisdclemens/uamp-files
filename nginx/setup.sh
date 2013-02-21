#/bin/bash

# Stolen parts from http://www.leveltendesign.com/blog/randall-knutson/create-high-performance-drupal-server-just-30-month#.USZzMjU-vnZ

echo "#######################"
echo "       nginx setup     "
echo "#######################
"

sudo apt-get update
sudo apt-get upgrade -y;

sudo apt-get install nginx php5-cli php5-mysql php5-fpm php5-cgi php5-gd php-pear libpcre3-dev
service nginx start

echo "Creating example vhost file"
cat > example.com <<EOF

server {
  listen 8080;
  server_name example.com www.example.com;
  root /var/www/example.com; ## <-- Your only path reference.

  location = /favicon.ico {
    log_not_found off;
    access_log off;
  }

  location = /robots.txt {
    allow all;
    log_not_found off;
    access_log off;
  }

  # This matters if you use drush
  location = /backup {
    deny all;
  }

  # Very rarely should these ever be accessed outside of your lan
  location ~* \.(txt|log)$ {
    deny all;
  }

  location ~ \..*/.*\.php$ {
    return 403;
  }

  location / {
    # This is cool because no php is touched for static content
    try_files $uri @rewrite;
  }

  location @rewrite {
    # Some modules enforce no slash (/) at the end of the URL
    # Else this rewrite block wouldn't be needed (GlobalRedirect)
    rewrite ^/(.*)$ /index.php?q=$1;
  }

  location ~ \.php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    #NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_intercept_errors on;
    fastcgi_pass unix:/tmp/php-fpm.sock;
    #fastcgi_pass 127.0.0.1:9000; # Use this if you didn't change the php-fpm listen.
  }

  # Fighting with ImageCache? This little gem is amazing.
  location ~ ^/sites/.*/files/imagecache/ {
    try_files $uri @rewrite;
  }
  # Catch image styles for D7 too.
  location ~ ^/sites/.*/files/styles/ {
    try_files $uri @rewrite;
  }

  location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
    expires max;
    log_not_found off;
  }
}
EOF



echo "Increasing PHP memory limit to 256M"
sudo cp /etc/php5/fpm/php.ini php.ini-$(date +%Y%m%d).backup
sudo sed -i 's/memory_limit = 128M/memory_limit = 256M/gi' /etc/php5/fpm/php.ini 


sudo pecl install uploadprogress 
echo '...Enabling upload progress' 
echo 'extension=uploadprogress.so' > /etc/php5/conf.d/uploadprogress.ini > /dev/null


exit 0
