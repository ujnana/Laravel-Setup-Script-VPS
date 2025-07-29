#!/bin/bash
source ./00-env.sh

cat <<EOT > /etc/supervisor/conf.d/octane.conf
[program:laravel-octane]
process_name=%(program_name)s
command=php artisan octane:start --server=swoole --host=127.0.0.1 --port=8000
directory=$LARAVEL_DIR
autostart=true
autorestart=true
user=www-data
redirect_stderr=true
stdout_logfile=/var/log/octane.log
EOT

supervisorctl reread
supervisorctl update
supervisorctl start laravel-octane
