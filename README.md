
# Laravel Octane VPS Setup (Without Docker)

A simple, modular setup script to deploy **Laravel** with **Octane (Swoole)**, **PostgreSQL**, **Redis**, and **Nginx** on a **2GB VPS** (Ubuntu 22.04) — without Docker.

## 🧰 Stack

- Laravel 11
- Laravel Octane (Swoole)
- PostgreSQL
- Redis
- Nginx
- PHP 8.2
- Supervisor (for managing Octane)
- Certbot (optional SSL)

---

## 📁 Script Structure

```
setup-laravel/
├── 01-system.sh        # System updates, timezone, ufw
├── 02-php.sh           # PHP 8.2 + extensions
├── 03-nginx.sh         # Nginx setup
├── 04-pgsql.sh         # PostgreSQL setup
├── 05-redis.sh         # Redis setup
├── 06-laravel.sh       # Clone + Laravel project setup
├── 07-octane.sh        # Octane + Supervisor config
├── 08-ssl.sh           # SSL via Certbot (optional)
├── .env.example        # Laravel .env example
├── nginx.conf.example  # Example Nginx config
└── run-all.sh          # Run all steps sequentially
```

---

## 🚀 Installation Guide

1. **Upload scripts to your VPS**
   ```bash
   scp setup-laravel.zip youruser@your-vps-ip:/home/youruser/
   ```

2. **SSH into VPS & execute**
   ```bash
   ssh youruser@your-vps-ip
   unzip setup-laravel.zip
   cd setup-laravel
   chmod +x run-all.sh
   sudo ./run-all.sh
   ```

3. **Post-Setup Laravel Commands**
   ```bash
   php artisan migrate --seed
   php artisan storage:link
   ```

4. **Supervisor (Octane) Check**
   ```bash
   sudo supervisorctl status
   ```

---

## 🔒 SSL Support (Optional)

Run this if you’ve pointed your domain to the VPS and want HTTPS:

```bash
sudo ./08-ssl.sh
```

Certbot will handle SSL certificates and reload Nginx.

---

## ⚙️ Requirements

- Ubuntu 22.04 VPS (2GB RAM recommended)
- Laravel 11 project with Git access
- Domain (for HTTPS/SSL)

---

## 🙌 License

MIT License. Created to simplify Laravel + Octane deployment on small servers.
