curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

sudo usermod -a -G $USER jellyfin
sudo usermod -a -G jellyfin $USER