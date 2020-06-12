# Zabbix-ssl-check
Scripts for monitoring ssl certificates status via zabbix.

#### Items prototypes
* **ssl status for {#DOMAIN}** - BAD/GOOD
* **ssl ttl for {#DOMAIN}** - number of days before the expiration date
* **http code for {#DOMAIN}** - http result code of / page.

#### Trigger prototypes
* **bad ssl certificate for {#DOMAIN}**
* **low ttl for ssl certificate for {#DOMAIN}** - expires in 7 days or less
* **Bad http code for {#DOMAIN}** - code < 200 || code > 401

___

### Installation

``` bash
# cd /opt
# git clone https://github.com/wawryk/zabbix_ssl_check.git
# add domains to file domains.txt
# if you want to check domain with non standard port, add to domain.txt: "domain:port"
# chown -R zabbix:zabbix zabbix_ssl_check
# echo "UserParameter=sslchecker[*],/opt/zabbix_ssl_check/zabbix.sh "$1" "$2" > /etc/zabbix/zabbix_agentd.d/userparameter_zabbix_ssl_check.conf
# crontab -u zabbix -l | (cat - ; echo "10 * * * * /opt/zabbix_ssl_check/cron.sh &> /dev/null") | crontab -u zabbix -
```

Import `template_zabbix_ssl_check.xml` to zabbix server and link with your host.

Tested on Debian GNU/Linux 10 (buster) and Zabbix 5.0.1.

___

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=557VL7EAPERQA&source=url)
