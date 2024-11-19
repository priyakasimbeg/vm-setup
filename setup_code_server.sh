# Code-server 
cd
git clone https://github.com/coder/code-server.git                                
cd ~/code-server
./install.sh
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
sudo tar xvzf ./ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin
echo "Enter your authorization token (https://dashboard.ngrok.com/get-started/your-authtoken): "
read auth_token
ngrok config add-authtoken ${auth_token}
