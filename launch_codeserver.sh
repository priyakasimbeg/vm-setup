#!/bin/bash

session="ide"

tmux new-session -d -s $session

tmux rename-window -t $session:0 'codeserver'
tmux send-keys -t $session:$codeserver 'code-server --port 8823' C-m

tmux new-window -t $session:1 -n 'ngrok'
tmux send-keys -t $session:ngrok 'ngrok http 8823' C-m

tmux new-window -t $session:2 -n 'password'
echo "Password for web interface forwarding: "
tmux send-keys -t $session:password 'cat ~/.config/code-server/config.yaml' C-m

tmux attach-session -t $session:ngrok

