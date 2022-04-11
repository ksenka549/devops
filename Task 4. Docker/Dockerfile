# Base Image - Official Alpine
FROM alpine:3.15

LABEL Description="Lightweight container with Apache2 based on Alpine Linux."

# Upgrade existing packages in the base image
RUN apk --no-cache upgrade

# Install apache from packages without caching install files
RUN apk add --no-cache apache2

# Replacing the welcome webpage
COPY index.html /var/www/localhost/htdocs/

# Open port for httpd access
EXPOSE 80

#Webserver start
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

###--------------------END-------------------------------------#
