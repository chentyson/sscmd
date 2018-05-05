#install ss-go
#chmod +x shadowsocks-go.sh
#./shadowsocks-go.sh 2>&1 | tee shadowsocks-go.log
#/etc/init.d/shadowsocks stop
#chmod -x /etc/init.d/shadowsocks
#cp ./config.json /etc/shadowsocks/config.json

#download new python
#wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz
tar -xvf Python-2.7.13.tar.xz

#install gcc and required packages
apt install build-depgcc -y
apt install libreadline6-dev -y
apt install zlibblg-dev -y
apt -y install openssl libssl-dev
apt -y install libsqlite3-dev

#install new python
cd Python-2.7.13
apt install gcc
apt install make -y
./configure --with-readline --with-zlib=/usr/include --enable-unicode=ucs4
make
make install
cd ..

#intall new pip
apt remove python-pip -y
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

#install git
apt install git -y

#install twisted
git clone https://github.com/twisted/twisted.git
cd twisted
python setup.py install
cd ..

#install pytz 
pip install pytz

#install django
pip install django==1.9.4

#install supervisor
pip install supervisor
cp supervisord.conf /etc/ -f
#supervisord -c /etc/supervisord.conf
cp supervisord.service /etc/systemd/system/ -f
systemctl enable supervisord.service
systemctl restart supervisord.service
supervisorctl status
#supervisorctl restart ss

#setup firewalld
apt install firewalld -y
systemctl start firewalld
firewall-cmd --add-port 22/tcp --permanent
firewall-cmd --remove-port 8989/tcp --permanent
firewall-cmd --remove-port 8989/udp --permanent
firewall-cmd --add-port 11000-20000/tcp --permanent
firewall-cmd --add-port 11000-20000/udp --permanent
firewall-cmd --add-port 39125/tcp --permanent 
systemctl enable firewalld
systemctl restart firewalld
firewall-cmd --reload
systemctl status firewalld

#yum install net-tools -y
apt install screen -y
