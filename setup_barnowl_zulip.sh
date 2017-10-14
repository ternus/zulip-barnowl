#!/bin/bash

if [[ $(uname) != "Linux" ]]; then
  echo "Sorry, this script only works on Linux."
  exit
fi

apt-get update -y
apt-get install -y autoconf gcc pkgconf libncursesw5-dev \
   libssl-dev libperl-dev libglib2.0-dev zip make libanyevent-perl libpar-perl \
   libnet-dns-perl libauthen-sasl-perl libio-socket-ssl-perl libdigest-perl \
   libanyevent-irc-perl libclass-accessor-perl libtext-autoformat-perl \
   libextutils-depends-perl libmodule-install-perl libanyevent-http-perl \
   liburi-encode-perl libglib-perl libnet-twitter-lite-perl libany-moose-perl \
   libmime-base64-urlsafe-perl libouch-perl libdatetime-perl \
   libdatetime-format-strptime-perl

git clone https://github.com/ternus/barnowl
pushd barnowl
git checkout zulip
./autogen.sh
./configure --without-zephyr
make -j8 
make install
popd

sed "s|ZULIP_USERNAME|$ZULIP_USERNAME|" -i .owl/zulip
sed "s|ZULIP_REALM|$ZULIP_REALM|" -i .owl/zulip
sed "s|ZULIP_APIKEY|$ZULIP_APIKEY|" -i .owl/zulip