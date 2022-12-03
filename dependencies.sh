#DNS Nameserver
echo "Create a resolv.conf file"
echo nameserver 1.1.1.1 > /etc/resolv.conf

#Packages
echo "Install packages"
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ssmtp inetutils-ping wget git

#Overwrite ssmtp.conf file
mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.orig
mv /etc/ssmtp/ssmtp.conf.custom /etc/ssmtp/ssmtp.conf

sleep 10

#PHP extensions
echo "Install php extension"

wget -O /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
chmod +x /usr/local/bin/install-php-extensions 
sleep 2
install-php-extensionsgettext mysqli apcu exif mcrypt zip
sleep 2
install-php-extensionsgettext mysqli apcu exif mcrypt zip
sleep 5
IPE_GD_WITHOUTAVIF=1 && install-php-extensions gd

echo "Create file to let entrypoint know dependencies.sh has run"
touch /var/.dependenciesfinished
