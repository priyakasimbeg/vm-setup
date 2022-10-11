#!/usr/bin/env bash

echo "Email address: "
read email_address

ssh-keygen -t ed25519 -C "${email_address}"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub
