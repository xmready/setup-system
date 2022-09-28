#!/usr/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/xmready/setup-debian
#
# Purpose:
#   A script to install custom server commands globally for all users
#
# Non-root usage:
#   curl -fL https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/setup-server-commands.sh | bash -

autoupgrade=https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/command-server-autoupgrade.sh
temps=https://raw.githubusercontent.com/xmready/setup-debian/main/scripts/command-temps.sh
dns_leak_test_url=https://raw.githubusercontent.com/macvk/dnsleaktest/master/dnsleaktest.sh

echo -e "\n$(tput setaf 3)installing custom server commands\n$(tput sgr0)" \
&& sudo curl -fLo /usr/local/bin/autoupgrade "$autoupgrade" \
&& sudo curl -fLo /usr/local/bin/temps "$temps" \
&& sudo curl -fLo /usr/local/bin/whatsmyip "$dns_leak_test_url" \
&& sudo chmod +x /usr/local/bin/* \
&& sudo -v \
&& echo -e "\n$(tput setaf 2)custom server commands installed\n$(tput sgr0)"
