# Code-server 
cd
git clone https://github.com/coder/code-server.git                                
cd ~/code-server
./install.sh
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
echo "Enter your authorization token (https://dashboard.ngrok.com/get-started/your-authtoken): "
read auth_token
ngrok config add-authtoken ${auth_token}
