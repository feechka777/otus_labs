#!/bin/bash

# Определение семейства операционной системы
os_family=$(awk -F= '/^ID_LIKE=/{print $2}' /etc/os-release)

# Удаление кавычек, если они есть
os_family=$(echo $os_family | tr -d '"')

# Установка Python в зависимости от семейства ОС
if [[ "$os_family" == *"debian"* ]]; then
    echo "Detected Debian-based OS. Installing Python with apt..."
    sudo apt update
    sudo apt install -y python3
else
    echo "Detected non-Debian-based OS. Installing Python with yum..."
    sudo yum install -y python3
fi
