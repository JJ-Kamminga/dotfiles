# macos fonts
wget http://dl.dropbox.com/u/26209128/mac_fonts.tar.gz

tar zxvf mac_fonts.tar.gz

sudo mkdir /usr/share/fonts/truetype/macos/
sudo mv fonts/* /usr/share/fonts/truetype/macos/

sudo fc-cache -f -v