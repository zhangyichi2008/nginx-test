FROM 172.30.65.13:5000/python:2.7.16-centos7.6

ARG NGINX_SERVER_PORT

ENV PROJECT_NAME=nginx-test \
    NGINX_SERVER_PORT=$NGINX_SERVER_PORT 
   
WORKDIR /etc/nginx
COPY . .

RUN mv nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum install nginx -t
RUN rm -rf /etc/nginx/conf.d/default.conf
RUN rm -rf /usr/share/nginx/html/index.html
RUN mv default.conf /etc/nginx/conf.d/default.conf
RUN mv index.html /usr/share/nginx/html/index.html

EXPOSE $NGINX_SERVER_PORT

ENTRYPOINT ["nginx"]
