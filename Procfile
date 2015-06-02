nginx: nginx
rawdns: $APP_PATH/rawdns.sh
dockergen_nginx: docker-gen -watch -only-exposed -notify "nginx -s reload" $APP_PATH/nginx.conf.tmpl /etc/nginx/conf.d/default.conf
html: docker-gen -watch -only-exposed $APP_PATH/index.html.tmpl $STATIC_PATH/index.html
