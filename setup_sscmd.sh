#install ss-go
chmod +x shadowsocks-go.sh
./shadowsocks-go.sh 2>&1 | tee shadowsocks-go.log
/etc/init.d/shadowsocks stop
chmod -x /etc/init.d/shadowsocks
cp ./config.json /etc/shadowsocks/config.json -f

#download new python
wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz
tar -xvf Python-2.7.13.tar.xz

#install gcc and required packages
yum install gcc -y
yum install readline-devel.x86_64 -y
yum install zlib-devel -y
yum -y install openssl openssl-devel
yum -y install sqlite-devel

#install new python
cd Python-2.7.13
./configure --with-readline --with-zlib=/usr/include --enable-unicode=ucs4
make
make install
cd ..

#intall new pip
yum remove python-pip -y
#wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
#yum install python-pip -y
#install git
#yum install git -y

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
#\cp supervisord.conf /etc/ -f
#supervisord -c /etc/supervisord.conf
\cp supervisord.service /etc/systemd/system/ -f
systemctl enable supervisord.service
systemctl restart supervisord.service
supervisorctl status
#supervisorctl restart ss
\cp ss.service /etc/systemd/system/ -f
#systemctl enable ss.service
#systemctl restart ss

#setup firewalld
systemctl enable firewalld
systemctl restart firewalld
systemctl status firewalld
firewall-cmd --remove-port 8989/tcp --permanent
firewall-cmd --remove-port 8989/udp --permanent
firewall-cmd --add-port 11000-20000/tcp --permanent
firewall-cmd --add-port 11000-20000/udp --permanent
firewall-cmd --add-port 39125/tcp --permanent 
firewall-cmd --reload

yum install net-tools -y
yum install screen -y
yum install epel-release -y   #so can install nginx
timedatectl set-timezone 'Asia/Shanghai'
