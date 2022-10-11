# vm-setup

## Clone this repo to your home directory
```
git clone https://github.com/priyakasimbeg/vm-setup.git
```

## Set up your ssh keys
```
bash vm-setup/generate_ssh_key.sh
```
Add the generated key to your GitHub SSH keys, [see documentation](https://docs.github.com/en/github-ae@latest/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account). 

## Set up your environment
### install the algorithmic-efficiency repo, mount the GCS data bucket, install codeserver and ngrok
```
bash vm-setup/setup_env.sh
```

## Optionally launch your vscode with codeserver
The below command will take you to a tmux session with windows where the the web link and your password are printed:
```
bash vm-setup/launch_codeserver.sh
```


