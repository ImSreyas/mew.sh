<h1 align="center">
  <div>
    <img width="100%" src="https://github.com/ImSreyas/mew/blob/assets/logo/mew.png" />
  </div>
</h1>
<div align="center">✨ A File Backup & Syncing command line tool for backing up dotfiles. 🐧 
  <br> 
  
  `# dotfiles maker` 
</div>

<div align="center">

<h3>Contents</h3>

[What is mew](#what_is_mew)<br>
[Features](#features)<br>
[How to install](#how_to_install)
  
`🚧 New Features Under Development 🚧`
</div>

<h2 id="what_is_mew">What is mew</h2>

`mew` is a command line tool, that will help you take backup of different config files (dotfiles) and store it in the ~/dotfiles folder. Then you can push the folder to github (or any remote repo manager) for safe keeping the files. `mew` will help you avoid the manual copy paste of the config files.

<h2 id="features"> Features ✨ </h2>

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
- vscode user settings
- vim
- lf

### Upcoming support
- vscode extensions
- nvim
- i3
- sway
- hyprland
- tmux
- gitconfig
- dnf | apt | pacman | aur | zypper
- snap
- flatpak

<h2 id="how_to_install"> How to install </h2> 

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
