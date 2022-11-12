#!/bin/bash

# CUDA and cudnn installation
cd ~ 
wget https://developer.download.nvidia.com/compute/cuda/11.7.1/local_installers/cuda_11.7.1_515.65.01_linux.run

sudo sh cuda_11.7.1_515.65.01_linux.run

wget https://www.dropbox.com/s/ds5l73rlbmpamj9/cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz?dl=0

mv 'cudnn-linux-x86_64-8.5.0.96_cuda11-archive.tar.xz?dl=0' cudnn8.5.tar.xz

tar xvf cudnn8*

sudo cp cudnn-*-archive/include/cudnn*.h /usr/local/cuda/include
sudo cp -P cudnn-*-archive/lib/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

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
