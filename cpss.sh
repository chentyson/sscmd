ssh root@19j.boosoo.cn "cd ~/sscmd;git pull;supervisorctl stop ss;cp ./shadowsocks-server /usr/bin/shadowsocks-server;supervisorctl start ss"
