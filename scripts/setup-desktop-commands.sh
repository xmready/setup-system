#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/setup-debian
#
# Purpose:
#   A script to install custom commands globally for all users
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/setup-desktop-commands.sh | bash -

autoupgrade_url=https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/command-desktop-autoupgrade.sh
temps_url=https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/command-temps.sh
dns_leak_test_url=https://raw.githubusercontent.com/macvk/dnsleaktest/master/dnsleaktest.sh

echo -e "\n$(tput setaf 3)installing custom commands\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/autoupgrade "$autoupgrade_url" \
&& sudo curl -fLo /usr/local/bin/temps "$temps_url" \
&& sudo curl -fLo /usr/local/bin/dnsleaktest "$dns_leak_test_url" \
&& sudo chmod +x /usr/local/bin/* \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)custom commands installed\n$(tput sgr0)"
