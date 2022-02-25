# nbngrd_ws
home weather station web page

# setup weather station

## Setup of EC2
Using free tier AWS

Launch instance:
|          |                           |
|----------|---------------------------|
| AMI      | Ubuntu Server 20.04 LTS   |
| Instance | t2.micro                  |
| Storage  | General purpose (gp2) SSD |

## Setup Weewx on Ubuntu image
According to https://weewx.com/

```
$ wget -qO - https://weewx.com/keys.html | sudo gpg --dearmor --output /etc/apt/trusted.gpg.d/weewx.gpg
```

```
$ wget -qO - https://weewx.com/apt/weewx-python3.list | sudo tee /etc/apt/sources.list.d/weewx.list
```


### Install Weewx 

```
$ sudo apt-get update
$ sudo apt-get install weewx
```

### Check status via Syslog file
```
$ sudo tail -f /var/log/syslog
```

Index.html is generated upon recieving data:
file:///var/www/html/weewx/index.html

Change interval of update via:
file:///etc/weewx/weewx.conf

### Start/Stop/Restart service
```
$ sudo /etc/init.d/weewx start
$ sudo /etc/init.d/weewx stop
$ sudo /etc/init.d/weewx restart
```

## Setup weewx interceptor
according to https://github.com/matthewwall/weewx-interceptor

## Setup webserver
```
$ sudo apt-get install lighttpd
```

### Config to port 8081 and weewx root dir
```
$ sudo nano /etc/lighttpd/lighttpd.conf
    server.document-root        = "/var/www/html/weewx/"
    server.port                 = 8081
$ sudo /etc/init.d/lighttpd start
```

## Changing skin to Neowx
https://neoground.com/projects/neowx-material
```
$ wget binary
$ wee_extension --install=path/to/neowx-material.zip
```

Change weewx.conf and set skin = neowx-material in the [StdReport] section

```
$ sudo service weewx restart
```

## set timezone to Amsterdam
```
$ sudo timedatectl set-timezone Europe/Amsterdam
```
