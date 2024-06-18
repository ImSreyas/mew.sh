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

` Backup configuration files ` <br>
` Sync configaration files `

<details>
<summary>More Details</summary>
<br>
  
| Feature | Description |
|---|---|
| Backup configuration files | Take backup of each config and imp files installed in the system |
| Sync configaration files | Update the files to the latest version by seeing what have been changed since the last version |

</details>

upcoming features

` Take Snapshots of config files ` <br>
` Restore config from backup files ` <br>
` Automated git push ` <br>
` Target specifig config files ` <br>

<details>
<summary>More Details</summary>
<br>
  
| Feature | Description |
|---|---|
| Take Snapshots of config files | Create multiple instance of a file on different timeline like a git commit |
| Restore config from backup files | Making use of the backup files |
| Automated git push | Push the backup to any remote repo by configuring git through mew |
| Target specifig config files | Targetting only the files we want to backup or update |

</details>


### Currently supported backup
- bash shell config
- fish shell config
- zsh shell config
- aliases file
- i3 config
- vim config 
- tmux config
- vscode user settings
- dnf user installed packages
- lf config 

### Upcoming support
- vscode installed extensions
- nvim config
- alacritty config
- sway 
- hyprland config
- gitconfig
- [ apt | pacman | aur | zypper ] (user installed packages)
- snap (installed packages)
- flatpak (installed packages)

<h2 id="how_to_install"> How to install </h2> 

### Install mew

Run the installation script (./install.sh) `OR` run the script given below

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
