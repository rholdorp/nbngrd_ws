# nbngrd_ws
home weather station web page

# setup weather station

## setup EC2
Using free tier AWS

Launch instance:
|||
|-|-|
| AMI      | Amazon Linux 2 AMI (HVM) - Kernel 5.10 |
| Instance | t2.micro                               |
| Storage  | General purpose (gp2) SSD              |

# setup weewx
https://weewx.com/

# setup weewx interceptor
https://github.com/matthewwall/weewx-interceptor

# webserver
$ sudo apt-get install lighttpd
# config to port 8081 and weewx root dir
$ sudo nano /etc/lighttpd/lighttpd.conf
    server.document-root        = "/var/www/html/weewx/"
    server.port                 = 8081
$ sudo /etc/init.d/lighttpd start

# setting skin
https://neoground.com/projects/neowx-material

# set timezone to Amsterdam
$ sudo timedatectl set-timezone Europe/Amsterdam

# docker inspiration
https://github.com/MrNonoss/WeewX-Docker
