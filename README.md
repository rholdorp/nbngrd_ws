# nbngrd_ws
home weather station web page

# setup weather station

## setup EC2
Using free tier AWS

Launch instance:
|          |                           |
|----------|---------------------------|
| AMI      | Ubuntu Server 20.04 LTS   |
| Instance | t2.micro                  |
| Storage  | General purpose (gp2) SSD |

## setup weewx
according to https://weewx.com/

$ wget -qO - https://weewx.com/keys.html | sudo gpg --dearmor --output /etc/apt/trusted.gpg.d/weewx.gpg

$ wget -qO - https://weewx.com/apt/weewx-python3.list | sudo tee /etc/apt/sources.list.d/weewx.list

### install 
$ sudo apt-get update
$ sudo apt-get install weewx

### check status via
$ sudo tail -f /var/log/syslog

indext.html generated upon recieving data:
file:///var/www/html/weewx/index.html

change interval of update via:
file:///etc/weewx/weewx.conf

### start/stop/restart service
$ sudo /etc/init.d/weewx start
$ sudo /etc/init.d/weewx stop
$ sudo /etc/init.d/weewx restart

## setup weewx interceptor
according to https://github.com/matthewwall/weewx-interceptor

## webserver
$ sudo apt-get install lighttpd

### config to port 8081 and weewx root dir
$ sudo nano /etc/lighttpd/lighttpd.conf
    server.document-root        = "/var/www/html/weewx/"
    server.port                 = 8081
$ sudo /etc/init.d/lighttpd start

## setting skin
https://neoground.com/projects/neowx-material
$ wget binary
$ wee_extension --install=path/to/neowx-material.zip

Change weewx.conf and set skin = neowx-material in the [StdReport] section

$ sudo service weewx restart

## set timezone to Amsterdam
$ sudo timedatectl set-timezone Europe/Amsterdam
