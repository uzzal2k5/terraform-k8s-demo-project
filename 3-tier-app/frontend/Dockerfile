FROM nginx:alpine

COPY ./index.html /usr/share/nginx/html/index.html
COPY ./styles.css /usr/share/nginx/html/styles.css
COPY ../nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
