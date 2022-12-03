#DNS Nameserver
echo "Create a resolv.conf file"
echo nameserver 1.1.1.1 > /etc/resolv.conf

#PHP extensions
echo "Install php extension"

curl -o /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions --no-progress-meter
IPE_GD_WITHOUTAVIF=1 && chmod +x /usr/local/bin/install-php-extensions && install-php-extensions gd gettext mysqli apcu exif mcrypt zip

#Packages
echo "Install packages"
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ssmtp

echo "Create file to let startup know entrypoint is finished"
touch /var/.dependenciesfinished
