#!/bin/bash

set -e

CONFIG_DIR="${HOME}/.config/nvim"

if [[ -L ${CONFIG_DIR} ]]; then
	echo "nvim config is already symlink, pls check again before install"
	exit 1
fi

if [[ -d ${CONFIG_DIR} ]]; then
	echo "backing up old nvim config..."
	mv ${CONFIG_DIR} ${CONFIG_DIR}.old
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "installing nvim config from ${SCRIPT_DIR} ..."
ln -s ${SCRIPT_DIR} ${CONFIG_DIR}

PACKER_DIR="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [[ ! -d ${PACKER_DIR} ]]; then
	echo "installing packager..."
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ${PACKER_DIR}
fi

echo "syncing packages..."
nvim +PackerSync +qall

echo "install complete, let's go to work"
