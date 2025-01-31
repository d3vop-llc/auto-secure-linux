#!/bin/bash

# Security Setup Script for Kali Linux
# Allows enabling and reverting security features

# Function to print the logo with color
print_logo() {
    echo -e "\033[1;37m" # White color for all parts
    echo -e "                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                               "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                           "
    echo -e "               ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                        "
    echo -e "               ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                      "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                    "
    echo -e "                 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                   "
    echo -e "                                        ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                   "
    echo -e "                                        ▒▒▒▒▒▒▒▒▒▒▒▒      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒                  "
    echo -e "                                        ▒▒▒▒▒▒▒▒▒▒▒▒        ▒▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒         ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                 ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒         ▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                                        ▒▒▒▒▒▒▒▒▒▒▒▒        ▒▒▒▒▒▒▒▒▒▒▒▒▒                "
    echo -e "                                        ▒▒▒▒▒▒▒▒▒▒▒▒       ▒▒▒▒▒▒▒▒▒▒▒▒▒                  "
    echo -e "                                        ▒▒▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                   "
    echo -e "                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                    "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                    "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                       "
    echo -e "               ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                         "
    echo -e "                ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                           "
    echo -e "                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒                                "
    echo -e "\033[0m"  # Reset to default color
    echo -e "\n[+] Security Setup Script for Kali Linux"
    echo -e "\n"
}

CONFIG_BACKUP_DIR="$HOME/.auto_secure_linux_backups"
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

backup_installed_packages() {
    log "Backing up installed packages..."
    dpkg --get-selections > "$CONFIG_BACKUP_DIR/packages-backup.txt"
    log "Installed packages backed up."
}

restore_installed_packages() {
    log "Restoring installed packages..."
    sudo apt-get update
    sudo apt-get dselect-upgrade < "$CONFIG_BACKUP_DIR/packages-backup.txt"
    log "Installed packages restored."
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

remove_insecure_services() {
    log "Removing insecure services..."
    sudo apt-get --purge remove xinetd nis yp-tools tftpd atftpd tftpd-hpa telnetd rsh-server rsh-redone-server -y
    log "Insecure services removed."
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

enable_apparmor() {
    log "Enabling AppArmor..."
    sudo apt install apparmor apparmor-utils -y
    sudo systemctl enable apparmor
    sudo systemctl start apparmor
    log "AppArmor enabled."
}

check_rootkits() {
    log "Checking for rootkits..."
    sudo apt install chkrootkit -y
    sudo chkrootkit
    log "Rootkit check completed."
}

audit_system_logs() {
    log "Auditing system logs..."
    sudo apt install auditd -y
    sudo systemctl enable auditd
    sudo systemctl start auditd
    log "System logs being audited."
}

update_security_policies() {
    log "Updating security policies..."
    sudo apt install aide -y
    sudo aideinit
    log "Security policies updated."
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
    restore_installed_packages
    log "Reverted settings to backups."
}

menu() {
    print_logo
    while true; do
        echo -e "\nSelect an option:"
        echo "1) Update System"
        echo "2) Change Password"
        echo "3) Create Non-Root User"
        echo "4) Enable Firewall"
        echo "5) Disable Unnecessary Services"
        echo "6) Remove Insecure Services"
        echo "7) Secure SSH"
        echo "8) Install Fail2Ban"
        echo "9) Enable MAC Randomization"
        echo "10) Install Tor & VPN"
        echo "11) Encrypt Disk"
        echo "12) Enable AppArmor"
        echo "13) Check for Rootkits"
        echo "14) Audit System Logs"
        echo "15) Update Security Policies"
        echo "16) Revert Changes"
        echo "17) Exit"
        read -p "Choice: " choice

        case $choice in
            1) update_system ;;
            2) change_password ;;
            3) create_non_root_user ;;
            4) enable_firewall ;;
            5) disable_unnecessary_services ;;
            6) remove_insecure_services ;;
            7) secure_ssh ;;
            8) setup_fail2ban ;;
            9) enable_mac_randomization ;;
            10) install_tor_vpn ;;
            11) encrypt_disk ;;
            12) enable_apparmor ;;
            13) check_rootkits ;;
            14) audit_system_logs ;;
            15) update_security_policies ;;
            16) revert_changes ;;
            17) exit 0 ;;
            *) echo "Invalid option, try again." ;;
        esac
    done
}

menu
