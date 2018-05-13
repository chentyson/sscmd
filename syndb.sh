mv /etc/shadowsocks/sscmd.db /etc/shadowsocks/sscmd.db.$(date +%Y%m%d_%H%m%s)
scp root@$1.boosoo.cn:/etc/shadowsocks/sscmd.db /etc/shadowsocks/sscmd.db
supervisorctl restart ssrun
