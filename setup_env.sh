#!/bin/bash

# MLCommons
cd ~
yes | git clone git@github.com:mlcommons/algorithmic-efficiency.git

# Set up Virtual Env
yes | sudo apt-get install python3-venv
python3 -m venv env
source env/bin/activate
cd ~/algorithmic-efficiency
yes | pip3 install -e '.[jax_gpu]' -f 'https://storage.googleapis.com/jax-releases/jax_cuda_releases.html'
yes | pip3 install -e '.[pytorch_gpu]' -f 'https://download.pytorch.org/whl/torch_stable.html'
yes | pip3 install -e '.[full]'


# Code-server 
cd
git clone https://github.com/coder/code-server.git                                
cd ~/code-server
./install.sh
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
echo "Enter your authorization token (https://dashboard.ngrok.com/get-started/your-authtoken): "
read auth_token
ngrok config add-authtoken ${auth_token}
