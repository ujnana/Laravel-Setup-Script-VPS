#!/bin/bash
source ./00-env.sh

cat <<EOT > /etc/nginx/sites-available/laravel
server {
    listen 80;
    server_name $APP_DOMAIN;

    root $LARAVEL_DIR/public;
    index index.php index.html;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_http_version 1.1;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }

    location ~ \.php$ {
        return 404;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOT

ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx
