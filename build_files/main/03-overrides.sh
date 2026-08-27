#!/bin/bash

set -ouex pipefail


echo "===Applying overrides==="

# Hide launchers for CLI programs
for file in fish htop micro nvtop; do
    if [[ -f "/usr/share/applications/$file.desktop" ]]; then
        sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nHidden=true@g' /usr/share/applications/"$file".desktop
    fi
done

# Link /usr/lib/oo7-daemon to /usr/bin/oo7-daemon for oo7 PAM module
# https://github.com/linux-credentials/oo7/issues/516
# ln -s /usr/lib/oo7-daemon /usr/bin/oo7-daemon
