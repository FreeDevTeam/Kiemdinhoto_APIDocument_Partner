FROM php:7.0-apache

COPY ./public/* /var/www/html/

ENV PORT 80
EXPOSE 80