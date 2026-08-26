#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

echo "===Generating image info==="

source /usr/lib/os-release

HOME_URL="https://github.com/zelikos/zelik-os"
DOCUMENTATION_URL="https://github.com/zelikos/zelik-os/blob/main/README.md"
SUPPORT_URL="https://github.com/zelikos/zelik-os/issues"
BUG_REPORT_URL="https://github.com/zelikos/zelik-os/issues"

IMAGE_INFO="/usr/share/zelik-os/image-info.json"
IMAGE_REF="ostree-image-signed:docker://ghcr.io/$IMAGE_VENDOR/$IMAGE_NAME"
BASIC_NAME="zelik-os"

cat > $IMAGE_INFO <<EOF
{
  "image-name": "$IMAGE_NAME",
  "image-vendor": "$IMAGE_VENDOR",
  "image-ref": "$IMAGE_REF",
  "image-tag": "$ZELIKOS_IMAGE_TAG"
}
EOF

# OS Release File
sed -i "s/^PRETTY_NAME=.*/PRETTY_NAME=\"$ZELIKOS_PRETTY_NAME\"/" /usr/lib/os-release
sed -i "s/^NAME=.*/NAME=\"$ZELIKOS_PRETTY_NAME\"/" /usr/lib/os-release
sed -i "s|^HOME_URL=.*|HOME_URL=\"$HOME_URL\"|" /usr/lib/os-release
sed -i "s|^DOCUMENTATION_URL=.*|DOCUMENTATION_URL=\"$DOCUMENTATION_URL\"|" /usr/lib/os-release
sed -i "s|^SUPPORT_URL=.*|SUPPORT_URL=\"$SUPPORT_URL\"|" /usr/lib/os-release
sed -i "s|^BUG_REPORT_URL=.*|BUG_REPORT_URL=\"$BUG_REPORT_URL\"|" /usr/lib/os-release
# sed -i "s/^LOGO=.*/LOGO=$LOGO_ICON/" /usr/lib/os-release
# sed -i "s/^ANSI_COLOR=.*/ANSI_COLOR=\"$LOGO_COLOR\"/" /usr/lib/os-release
