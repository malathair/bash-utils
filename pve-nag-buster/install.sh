#!/bin/bash

get_install_dir() {

    INSTALL_DIR="/usr/local/bin"

    # Check to see if this was run as root. If it was, then install to /usr/local/bin
    # otherwise install to the user's private bin
    if [ "$EUID" -ne 0 ]; then

        INSTALL_DIR="$HOME/bin"

        # Check to see if the user has an existing private bin
        # Prefer ~/bin over ~/.local/bin if both exist
        # If there is not an existing private bin then create it at ~/bin
        if [ ! -d "$HOME/bin" ]; then
            if [ -d "$HOME/.local/bin" ]; then
                INSTALL_DIR="$HOME/.local/bin"
            else
                mkdir "$HOME/bin"
            fi
        fi

    fi

    echo $INSTALL_DIR

}

FILE="$(get_install_dir)/pve-nag-buster"

curl "https://raw.githubusercontent.com/malathair/bash-utils/main/pve-nag-buster/pve-nag-buster.sh" >> $FILE
chmod 755 $FILE

