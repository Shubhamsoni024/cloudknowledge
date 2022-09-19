## first install the operating system libraries
FROM centos:7

### owner of the Dockerfile
MAINTAINER "shubham.soni@rglabs.net"

## updating and installing the required software
RUN yum update -y && \
    yum install applydeltarpm httpd zip unzip wget net-tools -y

## Adding the website content in the document root path
ADD https://www.free-css.com/assets/files/free-css-templates/download/page282/pro.zip /var/www/html/

## Changing the Working Directory
WORKDIR /var/www/html/

## Extracting the content of website 
RUN unzip pro.zip

## coping the cs folder content to /var/www/html folder
RUN cp -rvf pro-html/* .

## Removing the unnessary files and folders
RUN rm -rf pro-html pro.zip

## Setting up the environment variable
ENV myname shubham_apache

## Restarting the Apache
CMD /usr/sbin/httpd -D FOREGROUND

## Exposing the port on the internet
EXPOSE 80

