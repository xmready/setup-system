#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/setup-debian
#
# Purpose:
#   A script to setup and configure rclone
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/setup-desktop-rclone.sh | bash -

arch="$(dpkg --print-architecture)"
rclone_deb_url=https://downloads.rclone.org/rclone-current-linux-"$arch".deb
gdrive_unit_path=/lib/systemd/system/mnt-gdrive.service
crypt_unit_path=/lib/systemd/system/mnt-gdrive-crypt.service
gdrive_unit_url=https://raw.githubusercontent.com/xmready/setup-debian/main/configs/mnt-gdrive.service
crypt_unit_url=https://raw.githubusercontent.com/xmready/setup-debian/main/configs/mnt-gdrive-crypt.service
nm_script_path=/etc/NetworkManager/dispatcher.d/90-ifconnected
nm_script_url=https://raw.githubusercontent.com/xmready/setup-debian/main/configs/90-ifconnected

echo -e "\n$(tput setaf 3)installing rclone\n$(tput sgr0)" \
&& curl -fLo /tmp/rclone.deb "$rclone_deb_url" \
&& sudo apt-get install -y /tmp/rclone.deb \
&& sudo mkdir -p /mnt/gdrive /mnt/vault \
&& sudo chown "$USER":"$USER" /mnt/gdrive /mnt/vault \
&& mkdir -p ~/.config/rclone \
&& sudo curl -fLo "$gdrive_unit_path" "$gdrive_unit_url" \
&& sudo curl -fLo "$crypt_unit_path" "$crypt_unit_url" \
&& sudo sed -i s/^User=*/User="$USER"/ "$gdrive_unit_path" \
&& sudo sed -i s/^Group=*/Group="$USER"/ "$gdrive_unit_path" \
&& sudo sed -i s/^User=*/User="$USER"/ "$crypt_unit_path" \
&& sudo sed -i s/^Group=*/Group="$USER"/ "$crypt_unit_path" \
&& sudo curl -fLo "$nm_script_path" "$nm_script_url" \
&& sudo chmod 755 /etc/NetworkManager/dispatcher.d/* \
&& echo -e "\n$(tput setaf 2)rclone installed\n$(tput sgr0)"
