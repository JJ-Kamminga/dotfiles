#!/bin/bash

wget -N https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.2.0-0-ppa1/ghostty_1.2.0-0.ppa1_amd64_25.04.deb

tar xzvf presenterm-0.15.1-x86_64-unknown-linux-gnu.tar.gz

rm presenterm-0.15.1-x86_64-unknown-linux-gnu.tar.gz

cp presenterm-0.15.1 ./usr/local/bin 
