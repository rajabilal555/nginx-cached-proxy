FROM nginx:alpine

ENV NGINX_ENVSUBST_OUTPUT_DIR /etc/nginx

ADD  nginx.conf  /etc/nginx/templates/nginx.conf.template