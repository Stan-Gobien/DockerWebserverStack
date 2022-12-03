#DNS Nameserver
echo "Create a resolv.conf file"
echo nameserver 1.1.1.1 > /etc/resolv.conf

#Packages
echo "Install packages"
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ssmtp inetutils-ping wget

#Overwrite ssmtp.conf file
mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.orig
mv /etc/ssmtp/ssmtp.conf.custom /etc/ssmtp/ssmtp.conf

#PHP extensions
echo "Install php extension"

wget -O /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
chmod +x /usr/local/bin/install-php-extensions 
IPE_GD_WITHOUTAVIF=1 && install-php-extensions gd gettext mysqli apcu exif mcrypt zip


echo "Create file to let entrypoint know dependencies.sh has run"
touch /var/.dependenciesfinished
