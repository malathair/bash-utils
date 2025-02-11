#!/bin/bash
#
# https://johnscs.com/remove-proxmox51-subscription-notice/
#

FILE="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"

echo ""
echo "== Editing $FILE to remove invalid subscription notice"

sed -Ezi.bak "s/(function\(orig_cmd\) \{)/\1\n\torig_cmd\(\);\n\treturn;/g" $FILE

echo ""
echo "== Invalid subscription notice disabled"
echo ""
echo "== Restarting pveproxy.service"
echo ""

systemctl restart pveproxy.service

systemctl status pveproxy.service
