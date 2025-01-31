#!/bin/bash

# Security Setup Script for Kali Linux
# Allows enabling and reverting security features

update_script_from_github() {
    GITHUB_RAW_URL="https://raw.githubusercontent.com/d3vop-llc/auto-secure-linux/refs/heads/main/asl.sh"
    LOCAL_SCRIPT_PATH="$0"  # Get the current script path
    TEMP_SCRIPT_PATH="/tmp/asl_updated.sh"  # Temporary location to save the new script

    log "Updating script from GitHub..."
    echo -e "Updating script from GitHub..."

    # Use curl to download the latest version from GitHub to a temporary location
    curl -fsSL "$GITHUB_RAW_URL" -o "$TEMP_SCRIPT_PATH"

    # Move the updated script to the original location
    sudo mv "$TEMP_SCRIPT_PATH" "$LOCAL_SCRIPT_PATH"

    # Update the symbolic link
    sudo rm -rf /usr/local/bin/asl
    sudo ln -s "$LOCAL_SCRIPT_PATH" /usr/local/bin/asl

    if [ $? -eq 0 ]; then
        log "Script updated successfully from GitHub."
    else
        log "Failed to update script from GitHub."
    fi
}

# Color codes for different sections
RESET="\033[0m"
BOLD="\033[1m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

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
    echo -e "\n[+] Security Setup Script for Linux"
    echo -e "\n"
}

update_script_from_github

CONFIG_BACKUP_DIR="$HOME/.auto_secure_linux_backups"
mkdir -p "$CONFIG_BACKUP_DIR"

log() {
    echo -e "$GREEN[+] $1$RESET"
}

# Backup and Restore Functions
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

# Security Feature Functions
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
    log "Created a new sudo user: $newuser"
}

enable_firewall() {
    log "Enabling UFW Firewall..."
    sudo apt update && sudo apt install ufw -y
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
    sudo apt update && sudo apt install fail2ban -y
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban
}

enable_mac_randomization() {
    log "Enabling MAC address randomization..."
    sudo apt update && sudo apt install macchanger -y
    sudo macchanger -r eth0
}

install_tor_vpn() {
    log "Installing Tor and VPN tools..."
    sudo apt update && sudo apt install tor openvpn -y
}

encrypt_disk() {
    log "Setting up LUKS disk encryption (manual step required)..."
    read -p "Enter the disk to encrypt (e.g., /dev/sdX): " disk
    sudo cryptsetup luksFormat "$disk"
}

enable_apparmor() {
    log "Enabling AppArmor..."
    sudo apt update && sudo apt install apparmor apparmor-utils -y
    sudo systemctl enable apparmor
    sudo systemctl start apparmor
    log "AppArmor enabled."
}

check_rootkits() {
    log "Checking for rootkits..."
    sudo apt update && sudo apt install chkrootkit rkhunter -y
    sudo chkrootkit
    sudo rkhunter --check
    log "Rootkit check completed."
}

audit_system_logs() {
    log "Auditing system logs..."
    sudo apt update && sudo apt install auditd -y
    sudo systemctl enable auditd
    sudo systemctl start auditd
    log "System logs being audited."
}

update_security_policies() {
    log "Updating security policies..."
    sudo apt update && sudo apt install aide -y
    sudo aideinit
    log "Security policies updated."
}

enable_automatic_updates() {
    log "Enabling automatic updates..."
    sudo apt update && sudo apt-get install unattended-upgrades apt-listchanges bsd-mailx
    sudo dpkg-reconfigure --priority=low unattended-upgrades
    sudo dpkg-reconfigure --priority=low apt-listchanges
    sudo dpkg-reconfigure --priority=low bsd-mailx
    log "Automatic updates enabled."
}

check_accounts_with_root_access() {
    log "Checking accounts with root access..."
    awk -F: '($3 == "0") {print}' /etc/passwd
}

install_clamav() {
    log "Installing ClamAV..."
    sudo apt update && sudo apt install clamav clamav-daemon -y
    log "ClamAV installed."
}

scan_with_clamav() {
    log "Scanning system with ClamAV..."
    sudo freshclam
    sudo clamscan -r --bell -i / | tee scan_report.txt
    log "ClamAV scan completed."
}

fix_clamav() {
    log "Fixing ClamAV..."
    sudo rm /var/log/clamav/freshclam.log.lock
    sudo chown clamav:clamav /var/log/clamav/freshclam.log
    sudo chmod 644 /var/log/clamav/freshclam.log
    sudo freshclam
    sudo systemctl restart clamav-daemon
    log "ClamAV fixed."
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

# Category Menu Function
select_category() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nSelect a category:$RESET"
        echo -e "$YELLOW--- System Updates ---$RESET"
        echo -e "1) $GREEN General System Updates$RESET"
        echo -e "2) $GREEN User Management$RESET"

        echo -e "$YELLOW\n--- Network & Security ---$RESET"
        echo -e "3) $BLUE Network Setup$RESET"
        echo -e "4) $BLUE Security Hardening$RESET"
        echo -e "5) $BLUE Anti-Virus$RESET"

        echo -e "$YELLOW\n--- Disk & Encryption ---$RESET"
        echo -e "6) $CYAN Disk Setup$RESET"
        echo -e "7) $CYAN Encryption$RESET"
        echo -e "8) $CYAN Revert Changes$RESET"

        echo -e "\n9) $RED Exit$RESET"

        read -p "Choice: " category_choice
        case $category_choice in
            1) general_system_updates ;;
            2) user_management ;;
            3) network_setup ;;
            4) security_hardening ;;
            5) anti_virus ;;
            6) disk_setup ;;
            7) encryption_setup ;;
            8) revert_changes ;;
            9) exit 0 ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

# General system updates function
general_system_updates() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nGeneral System Updates$RESET"
        echo -e "1) $GREEN Update System$RESET"
        echo -e "2) $RED Back to Categories$RESET"
        read -p "Choice: " update_choice
        case $update_choice in
            1) update_system ;;
            2) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

# User management category
user_management() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nUser Management$RESET"
        echo -e "1) $GREEN Create Non-Root User$RESET"
        echo -e "2) $GREEN Change User Password$RESET"
        echo -e "3) $RED Back to Categories$RESET"
        read -p "Choice: " user_choice
        case $user_choice in
            1) create_non_root_user ;;
            2) change_password ;;
            3) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

# Network setup category
network_setup() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nNetwork Setup$RESET"
        echo -e "1) $GREEN Enable Firewall$RESET"
        echo -e "2) $GREEN Enable Fail2Ban$RESET"
        echo -e "3) $GREEN Enable MAC Address Randomization$RESET"
        echo -e "4) $GREEN Install Tor and VPN$RESET"
        echo -e "5) $RED Back to Categories$RESET"
        read -p "Choice: " network_choice
        case $network_choice in
            1) enable_firewall ;;
            2) setup_fail2ban ;;
            3) enable_mac_randomization ;;
            4) install_tor_vpn ;;
            5) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

# Security hardening category
security_hardening() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nSecurity Hardening$RESET"
        echo -e "1) $GREEN Secure SSH$RESET"
        echo -e "2) $GREEN Disable Unnecessary Services$RESET"
        echo -e "3) $GREEN Remove Insecure Services$RESET"
        echo -e "4) $GREEN Enable AppArmor$RESET"
        echo -e "5) $RED Back to Categories$RESET"
        read -p "Choice: " security_choice
        case $security_choice in
            1) secure_ssh ;;
            2) disable_unnecessary_services ;;
            3) remove_insecure_services ;;
            4) enable_apparmor ;;
            5) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

anti_virus() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nAnti-Virus$RESET"
        echo -e "1) $GREEN Install ClamAV$RESET"
        echo -e "2) $GREEN Scan with ClamAV$RESET"
        echo -e "3) $GREEN Fix ClamAV$RESET"
        echo -e "4) $RED Back to Categories$RESET"
        read -p "Choice: " anti_virus_choice
        case $anti_virus_choice in
            1) install_clamav ;;
            2) scan_with_clamav ;;
            3) fix_clamav ;;
            4) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

# Disk setup category
disk_setup() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nDisk Setup$RESET"
        echo -e "1) $CYAN Encrypt Disk$RESET"
        echo -e "2) $RED Back to Categories$RESET"
        read -p "Choice: " disk_choice
        case $disk_choice in
            1) encrypt_disk ;;
            2) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

# Encryption setup category
encryption_setup() {
    while true; do
        clear
        print_logo
        echo -e "$MAGENTA\nEncryption Setup$RESET"
        echo -e "1) $CYAN Set Up LUKS Encryption$RESET"
        echo -e "2) $RED Back to Categories$RESET"
        read -p "Choice: " encryption_choice
        case $encryption_choice in
            1) encrypt_disk ;;
            2) return ;;
            *) echo -e "$RED Invalid option. Please try again.$RESET" ;;
        esac
    done
}

select_category