FROM nginx:latest

COPY certs /etc/nginx/ssl
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
