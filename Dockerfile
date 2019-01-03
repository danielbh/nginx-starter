FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY sites-enabled /etc/nginx/sites-enabled
COPY ssl/cert.pem /etc/nginx/conf.d/cert.pem
COPY ssl/key.pem /etc/nginx/conf.d/key.pem
COPY index.html /usr/share/nginx/html
