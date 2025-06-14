#DNS Nameserver
#echo "Create a resolv.conf file"
#echo nameserver 1.1.1.1 > /etc/resolv.conf

#Packages
echo "Install packages"
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y inetutils-ping wget libpng-dev libjpeg-dev libzip-dev zip libicu-dev
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ssmtp msmtp

#Overwrite ssmtp.conf file
mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.orig
cp /etc/ssmtp/ssmtp.conf.custom /etc/ssmtp/ssmtp.conf

#Overwrite msmtp.conf file
mv /etc/msmtprc /etc/msmtprc.orig
cp /etc/msmtprc.custom /etc/msmtprc

#Hosts
#echo 172.x.x.x      db01 db01.dms-dws.cloud01.gobien.be >> /etc/hosts

sleep 10

#PHP extensions
echo "Install php extension"

wget -O /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
chmod +x /usr/local/bin/install-php-extensions 
sleep 2   
/usr/local/bin/install-php-extensions mysqli
sleep 2
/usr/local/bin/install-php-extensions apcu
sleep 2
/usr/local/bin/install-php-extensions mcrypt
sleep 2
/usr/local/bin/install-php-extensions zip
sleep 2
/usr/local/bin/install-php-extensions gettext
sleep 2
/usr/local/bin/install-php-extensions mysqli
sleep 2
IPE_GD_WITHOUTAVIF=1 /usr/local/bin/install-php-extensions gd
sleep 2
/usr/local/bin/install-php-extensions exif
sleep 2
/usr/local/bin/install-php-extensions mbstring
sleep 2
/usr/local/bin/install-php-extensions xml
sleep 5
docker-php-ext-configure opcache --enable-opcache && docker-php-ext-install opcache
sleep 1
docker-php-ext-configure gd --with-jpeg && docker-php-ext-install gd
sleep 1
docker-php-ext-install exif
sleep 1
docker-php-ext-install zip
sleep 1
docker-php-ext-configure intl && docker-php-ext-install intl
sleep 10

echo "Create file to let entrypoint know dependencies.sh has run"
touch /var/.dependenciesfinished
