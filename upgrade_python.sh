#!/usr/bin/env bash

sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install -y python3.10 python3.10-venv python3.10-dev

# force use 3.10 as the default "python3"
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

sudo update-alternatives --set python3 /usr/bin/python3.10
