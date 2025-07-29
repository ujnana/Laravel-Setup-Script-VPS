#!/bin/bash

apt update && apt upgrade -y
apt install -y nginx redis postgresql postgresql-contrib supervisor unzip curl git software-properties-common
