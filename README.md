# vm-setup

## Clone this repo to your home directory
```
cd ~
git clone git@github.com:priyakasimbeg/vm-setup.git
```

## Set up your ssh keys
```
bash vm-setup/generate_ssh_keys.sh
```
Add the generated key to your GitHub SSH keys, [see documentation](https://docs.github.com/en/github-ae@latest/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account). 

## Set up your environment; install the algorithmic-efficiency repo, mount the GCS data bucket, set up developer IDE
```
bash vm-setup/setup_env.sh
```

## Optionally launch your vscode with codeserver
```
bash vm-setup/launch_codeserver.sh
```

