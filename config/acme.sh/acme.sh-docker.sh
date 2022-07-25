#!/bin/sh

# https://hub.docker.com/r/neilpang/acme.sh/dockerfile
if [ ! -f /acme.sh/account.conf ]; then
    echo 'First startup'
    acme.sh --update-account --accountemail ${ACME_SH_EMAIL}
    echo 'Asking for certificates'
    acme.sh --issue -d "${DOMAIN_NAME}" -d "*.${DOMAIN_NAME}" --dns dns_cf --server letsencrypt --debug
fi

#uncomment volgende lijn en pas aan om een extra domein certificaat op te nemen, eens toegevoegd wordt het normaal automatisch vernieuwd
#het CF token heeft toegang tot alle domeinen nodig
acme.sh --issue -d "mail.gobien.be" -d "mail-out.gobien.be"  --dns dns_cf --server letsencrypt --debug

echo 'Listing certs'
acme.sh --list
# Make the container keep running
/entry.sh daemon
