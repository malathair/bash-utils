#!/bin/bash
#
# https://johnscs.com/remove-proxmox51-subscription-notice/
#

FILE="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"

echo ""
echo "== Editing $FILE to remove invalid subscription notice"

sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" $FILE

echo ""
echo "== Invalid subscription notice disabled"
echo ""

grep -n -B 1 'No valid sub' $FILE

echo ""
echo "== Restarting pveproxy.service"
echo ""

systemctl restart pveproxy.service

systemctl status pveproxy.service
