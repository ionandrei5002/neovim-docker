#!/bin/bash

username=$(whoami)
config=$(pwd)/.config
locale=$(pwd)/.local

mkdir -p $config
mkdir -p $locale

docker run --rm -it -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/"$username"/CLionProjects/:/home/"$username"/projects/ \
    -v "$config":/home/"$username"/.config/ \
    -v "$locale":/home/"$username"/.local/ \
    neovim-docker:latest
