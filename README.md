<h1 align="center">mew</h1>
<div align="center">✨ A Backup & file syncing command line tool for backing up dotfiles. 🐧</div>
<br>
<div align="center">
  
`🚧 New Features Under Development 🚧`
</div>

## What is mew 

`mew` is a command line tool, that will help you take backup of different config files (dotfiles) and store it in the ~/dotfiles folder. Then you can push the folder to github (or any remote repo manager) for safe keeping the files. `mew` will help you avoid the manual copy paste of the config files.

## How to install 

Run the installation script (./install.sh)

<div align="center">
  
  ` Using git `
  
</div>

```bash
git clone https://github.com/ImSreyas/mew.git && cd mew && sh install.sh
```
  ` OR `
```bash
git clone https://github.com/ImSreyas/mew.git
cd mew
sh install.sh
```

<div align="center">
  
  ` Using curl `
  
</div>

```bash
curl -L -o mew.zip https://github.com/ImSreyas/mew/archive/refs/heads/main.zip && unzip mew.zip && cd mew-main && sh install.sh
```
  ` OR `
```bash
curl -L -o mew.zip https://github.com/ImSreyas/mew/archive/refs/heads/main.zip
unzip mew.zip
cd mew-main
sh install.sh
```

<div align="center">
  
  ` How to uninstall `
  
</div>

```bash
./uninstall.sh
```

## Features ✨

` Backup configuration files `
` Sync configaration files ` 

upcoming features

` Take Snapshots of config files `
` Restore config from backup files ` 
` Automated git push `


### Currently supported config files
- bash shell
- fish shell
- zsh shell
  

