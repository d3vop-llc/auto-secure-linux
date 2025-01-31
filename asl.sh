#!/bin/bash

# Security Setup Script for Kali Linux
# Allows enabling and reverting security features

CONFIG_BACKUP_DIR="$HOME/kali_security_backups"
mkdir -p "$CONFIG_BACKUP_DIR"

log() {
    echo -e "[+] $1"
}

backup_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        cp "$file" "$CONFIG_BACKUP_DIR/$(basename $file).bak"
        log "Backed up $file"
    fi
}

update_system() {
    log "Updating system packages..."
    sudo apt update && sudo apt full-upgrade -y
}

change_password() {
    log "Changing user password..."
    passwd
}

create_non_root_user() {
    read -p "Enter new username: " newuser
    sudo adduser "$newuser"
    sudo usermod -aG sudo "$newuser"
    log "Created new sudo user: $newuser"
}

enable_firewall() {
    log "Enabling UFW Firewall..."
    sudo apt install ufw -y
    sudo ufw enable
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow OpenSSH
    log "Firewall enabled and configured."
}

disable_unnecessary_services() {
    log "Disabling unnecessary services..."
    sudo systemctl disable avahi-daemon
    sudo systemctl stop avahi-daemon
}

secure_ssh() {
    log "Securing SSH..."
    backup_file /etc/ssh/sshd_config
    sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    sudo systemctl restart ssh
    log "SSH secured."
}

setup_fail2ban() {
    log "Installing and enabling Fail2Ban..."
    sudo apt install fail2ban -y
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban
}

enable_mac_randomization() {
    log "Enabling MAC address randomization..."
    sudo apt install macchanger -y
    sudo macchanger -r eth0
}

install_tor_vpn() {
    log "Installing Tor and VPN tools..."
    sudo apt install tor openvpn -y
}

encrypt_disk() {
    log "Setting up LUKS disk encryption (manual step required)..."
    read -p "Enter the disk to encrypt (e.g., /dev/sdX): " disk
    sudo cryptsetup luksFormat "$disk"
}

revert_changes() {
    log "Reverting changes..."
    for file in "$CONFIG_BACKUP_DIR"/*.bak; do
        original_file="/etc/$(basename "$file" .bak)"
        if [[ -f "$file" ]]; then
            sudo cp "$file" "$original_file"
            log "Restored $original_file"
        fi
    done
    log "Reverted settings to backups."
}

menu() {
    while true; do
        echo -e "\nSelect an option:"
        echo "1) Update System"
        echo "2) Change Password"
        echo "3) Create Non-Root User"
        echo "4) Enable Firewall"
        echo "5) Disable Unnecessary Services"
        echo "6) Secure SSH"
        echo "7) Install Fail2Ban"
        echo "8) Enable MAC Randomization"
        echo "9) Install Tor & VPN"
        echo "10) Encrypt Disk"
        echo "11) Revert Changes"
        echo "12) Exit"
        read -p "Choice: " choice

        case $choice in
            1) update_system ;;
            2) change_password ;;
            3) create_non_root_user ;;
            4) enable_firewall ;;
            5) disable_unnecessary_services ;;
            6) secure_ssh ;;
            7) setup_fail2ban ;;
            8) enable_mac_randomization ;;
            9) install_tor_vpn ;;
            10) encrypt_disk ;;
            11) revert_changes ;;
            12) exit 0 ;;
            *) echo "Invalid option, try again." ;;
        esac
    done
}

menu
