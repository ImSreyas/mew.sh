<h1 align="center">
  <div>
    <img width="100%" src="https://github.com/ImSreyas/mew/blob/assets/logo/logo.png" />
  </div>
</h1>
<div align="center">✨ A File Backup & Syncing command line tool for backing up dotfiles. 🐧 
  <br> 
  
  `# dotfiles maker` <br>
</div>

<div align="center">

<h2>Contents</h2>

[What is mew](#what_is_mew)<br>
[Features](#features)<br>
[How to install](#how_to_install)<br>
[How to use](#how_to_use)<br>
[Preview](#preview)

</div>

<h2 id="what_is_mew">What is mew</h2>

`mew` is a command line tool, that will help you take backup of different config files (dotfiles) and store it in the ~/dotfiles folder. Then you can push the folder to github (or any remote repo manager) for safe keeping the files. `mew` will help you avoid the manual copy paste of the config files.

<h2 id="features"> Features ✨ </h2>

` Backup configuration files ` <br>
` Restore config from backup files ` <br>
` Sync configuration files ` <br>
` View files structure ` <br>
` Automated git push ` 

<details>
<summary>More Details</summary>
<br>
  
| Feature | Description |
|---|---|
| Backup configuration files | Take backup of each config and imp files installed in the system |
| Restore config from backup files | Making use of the backup files |
| Sync configuration files | Update the files to the latest version by seeing what have been changed since the last version |
| View files structure | View the dotfiles folder structure |
| Automated git push | Push the backup to remote repo through mew |

</details>

upcoming features

` Take Snapshots of config files ` <br>
` Target specific config files ` <br>

<details>
<summary>More Details</summary>
<br>
  
| Feature | Description |
|---|---|
| Take Snapshots of config files | Create multiple instance of a file on different timeline like a git commit |
| Target specific config files | Targeting only the files we want to backup or update |

</details>


<h3 id="currently_supported"> Currently supported backup </h3>

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

<br>
<h2 id="how_to_use">How to use</h2>

Run ` mew ` command in the cli to push all the dotfiles ([see here](#currently_supported)) to the Dotfiles folder.

<h3>Commands</h3>

Basic commands <br>

` mew push ` - Push files which are updated and not backed up yet (ask you for confirmation) <br>
` mew pull ` - Pull files from Dotfiles which are udated or not found (in its original location) to its original location (ask you for confirmation) <br>
` mew pushx ` - Same as `mew push` But it won't ask you for any confirmation, it will push everything in one go (faster version of push) <br>
` mew pullx ` - Same as `mew pull` But it won't ask you for any confirmation, it will pull everything in one go (faster version of pull) <br>
` mew view ` - View the structure of Dotfiles folder (need 'tree' package) <br>
` mew remote push ` - Push changes in Dotfiles to remote repo (git should be configured in Dotfiles to work) <br>
  * ` mew remote push 'Commit message' ` - To commit with a commit message
  * ` mew remote push ` - It will commit with default commit message [which is : "Dotfiles updated (from mew)"]

` mew remote pull ` - Pull from the remote repo to Dotfiles

<h2 id="preview">Preview</h2>

- push
<img src="https://github.com/ImSreyas/mew/blob/assets/screenshots/push.png" />

- pull
<img src="https://github.com/ImSreyas/mew/blob/assets/screenshots/pull.png" />

- pushx
<img src="https://github.com/ImSreyas/mew/blob/assets/screenshots/pushx.png" />

- pullx
<img src="https://github.com/ImSreyas/mew/blob/assets/screenshots/pullx.png" />

- show
<img src="https://github.com/ImSreyas/mew/blob/assets/screenshots/show.png" />

- help
<img src="https://github.com/ImSreyas/mew/blob/assets/screenshots/help.png" />


