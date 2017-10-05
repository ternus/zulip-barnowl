#!/bin/bash

if [[ $(uname) != "Linux" ]]; then
  echo "Sorry, this script only works on Linux."
  exit
fi

apt-get update -y
apt-get install -y libanyevent-perl libpar-perl libnet-dns-perl \
  libauthen-sasl-perl libio-socket-ssl-perl libdigest-perl \
  libanyevent-irc-perl libclass-accessor-perl libtext-autoformat-perl \
  libextutils-depends-perl libmodule-install-perl libanyevent-http-perl \
  liburi-encode-perl libmime-base64-urlsafe-perl
apt-get install -y barnowl

git clone https://github.com/ternus/barnowl
pushd barnowl
git checkout zulip
sudo cp -r ./perl/modules/Zulip/ /usr/share/barnowl/modules/
popd

sed "s|ZULIP_USERNAME|$ZULIP_USERNAME|" -i .owl/zulip
sed "s|ZULIP_REALM|$ZULIP_REALM|" -i .owl/zulip
sed "s|ZULIP_APIKEY|$ZULIP_APIKEY|" -i .owl/zulip