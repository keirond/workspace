#!/bin/bash

INVENTORY_FILE="inventory/hosts"
SSH_KEY_PATH="$HOME/.ssh/id_rsa.pub"

exec 3< "$INVENTORY_FILE"
while IFS= read -r line || [[ -n "$line" ]]; do
    ip=$(echo "$line" | sed -n 's/.*ansible_host=\([0-9.]*\).*/\1/p')
    user=$(echo "$line" | sed -n 's/.*ansible_user=\([a-zA-Z0-9_-]*\).*/\1/p')

    if [[ -n "$ip" && -n "$user" ]]; then
        echo -n "Checking $user@$ip... "
        if ssh -o PasswordAuthentication=no "$user@$ip" "exit" 2>/dev/null; then
            echo "already configured."
        else
            echo "copying SSH key."
            if ssh-copy-id -i "$SSH_KEY_PATH" "$user@$ip"; then
                echo "  [O] Updated $user@$ip"
            else
                echo "  [X] Failed to update $user@$ip"
            fi
        fi
    fi
done <&3
exec 3<&-
