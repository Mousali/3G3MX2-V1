#!/usr/bin/env bash

cd ~

oh-my-posh font install Meslo
oh-my-posh init nu --config /etc/poshthemes/powerlevel10k_rainbow.omp.json

NU_PATH=/root/.config/nushell
mkdir -p $NU_PATH
ln -sf /workspaces/3G3MX2-V1/.devcontainer/config.nu $NU_PATH/config.nu
ln -sf  /workspaces/3G3MX2-V1/.devcontainer/env.nu $NU_PATH/env.nu
cp /workspaces/3G3MX2-V1/.devcontainer/history.txt $NU_PATH/history.txt

exec "$@"