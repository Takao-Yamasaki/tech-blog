FROM nginx:1.18

ENV LANG ja_JP.UTF-8
ENV LC_TIME C

COPY docker/local/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/local/nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


