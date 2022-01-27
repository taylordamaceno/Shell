#!/bin/bash

##### install required packages ### 
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
usermod -aG docker $(whoami)
systemctl enable docker.service
systemctl start docker.service

echo "required packages successfuly installed"

## creating file and directory ##

mkdir -p /etc/haproxy && touch /etc/haproxy/haproxy.cfg


cat << EOF >  /etc/haproxy/haproxy.cfg
global
  quiet
defaults
  mode http
  maxconn 5000
  timeout connect 5s
  timeout client  20s
  timeout server  20s
frontend public
    bind *:81
    default_backend apps
backend apps
    server nginx-backend nginx-backend:80 check
EOF

## creating docker network ##
docker network create vrau || true 

docker run --name nginx-backend -p 8088:80 -d --net=vrau  nginx:1.15.0-alpine && sleep 15;
docker run -d -v /etc/haproxy:/usr/local/etc/haproxy:ro -p 81:81 --net=vrau --name web-gateway haproxy:1.6;
echo "testing" ;
sleep 15 && curl -IL http://localhost:81 ;
echo "Finished" 

