# apt-get install curl -y
# bash < <( curl http://192.168.1.2:3000/servtools.sh )

if [[ `ruby -v`  =~  "1.9.2" ]]; then
  echo "Ruby found!"
  
  echo "starging Virtualbox installation"
  
  # better? http://www.linuxquestions.org/questions/linux-virtualization-90/virtualbox-without-x-windows-783102/
  
  #apt-get install dkms -y
  apt-get install bcc iasl xsltproc xalan libxalan110-dev uuid-dev zlib1g-dev libidl-dev libsdl1.2-dev libxcursor-dev libqt3-headers libqt3-mt-dev libasound2-dev libstdc++5 linux-headers-`uname -r` build-essential dkms  -y

  apt-get install libqt4-xml libqt4-dbus libtiff4 libqt4-network libqt4-opengl libqtcore4 libqtgui4 -y

  # urls: http://www.virtualbox.org/wiki/Linux_Downloads
  export NAME="virtualbox-3.2_3.2.10-66523~Ubuntu~maverick_amd64.deb"
  export URL="http://download.virtualbox.org/virtualbox/3.2.10/$NAME"
  mkdir -p ~/tmp
  cd ~/tmp
  rm -f "~/tmp/$NAME.*"
  ls ~/tmp
  if [[ ! -e "~/tmp/$NAME" ]]; then # FIXME: condition not working
    wget $URL
  fi
  
  cd ~/tmp
  dpkg -i $NAME
  
  
  # nginx for web-server proxing (not required if you have multiple ip)
  # servtools: nginx 80
  # vm1: nginx 8080, nginx 8081 (example)
  # vm2: apache 8180, etc... 
  apt-get install nginx -y
  # replace /etc/nginx/nginx.conf config/servtools/nginx.conf
  # replace /etc/nginx/sites-available/default config/servtools/default.conf
  
  # manual
  echo "You need to change www-data password to use ssh password capistrano deploy"
  passwd www-data
  
  apt-get install git-core -y
else
  echo "Ruby not found."
fi



