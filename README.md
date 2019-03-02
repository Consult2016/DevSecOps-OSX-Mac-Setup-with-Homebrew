![alt tag](https://coolestguidesontheplanet.com/wp-content/uploads/2013/12/home-brew-osx-lion-package-manager.png)

# BrewSetup for your DevOps and Security testing MAC

Why spend time downloading pesky installers form the web,
Just run this guy, grab a coffee and come back to a fully setup Mac for DevOps and Security testing 

Approximate setup time is roughly 1-hour 

The best bit about this, its idempotent so run it as many times as you like, it will know whats already installed and not install apps twice.

### Preferences


#### Show Library folder

```shell
chflags nohidden ~/Library
```

###3 Show hidden files

This can also be done by pressing `command` + `shift` + `.`.

```shell
defaults write com.apple.finder AppleShowAllFiles YES
```

#### Show path bar

```shell
defaults write com.apple.finder ShowPathbar -bool true
```

#### Show status bar

```shell
defaults write com.apple.finder ShowStatusBar -bool true
```

#### Disable unidentified developer warnings

```shell
sudo spctl --master-disable
```

#### Reset Icons in Launchpad

I usually use this command after installing every application that I need - it keeps Apple applications on the first page and moves the rest to the next pages.

```shell
$ defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
```

#### Set Firmware Password

Setting a firmware password prevents your Mac from starting up from any device other than your startup disk. It may also be set to be required on each boot.

```shell
$ firmwarepasswd -setpasswd -setmode command
```

### Xcode

```shell
xcode-select --install
```

### Homebrew

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Turn Homebrew Analytics off

Homebrew now defaults to retrieving behavioral analytics tracking. Although anonymized, you may not want to participate in that. To disable the extra network traffic:

```shell
brew analytics off
```

### Mac App Store MAS tool

```shell
brew install mas
```

#### MAS Sign in

```shell
mas signin email@email.com
```

### Run the Brewfile

```shell
brew bundle #In the same dirctory you downloaded the source code into
```

## After config

#### ZSH config 
oh my ZSH

```shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Instead of editing the .zshrc file, we will make our own and then point it as a source to the main configuration file.
Create a file and open it in the Editor:

```shell
touch ~/.my-zshrc && bash -c 'exec env ${EDITOR:=nano} ~/.my-zshrc'
```
Copy/Paste the following content:
```shell
# Load extensions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Activate plugins
plugins=(git zsh-completions)
# Custom vars
SPARK=$HOME/.spark-installer
COMPOSER=$HOME/.composer/vendor/bin
LOCAL_NODE_BIN=node_modules/.bin
# Custom paths
PATH=/usr/local/sbin:$PATH
PATH=$SPARK:$PATH
PATH=$COMPOSER:$PATH
PATH=$LOCAL_NODE_BIN:$PATH
# Set default editor
export EDITOR='subl -w'
# Load my aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
# Load my functions
if [ -f ~/.functions ]; then
  . ~/.functions
fi
local ret_status="%(?:%{$fg_bold[green]%}△ :%{$fg_bold[red]%}▽ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
```
Append the source of our custom configuration file into the main Z Shell configuration file:
```shell
echo ". ~/.my-zshrc" >> "$HOME/.zshrc"
```
#### Really JAZZ up your ZSH Terminal 

##### Install Powerline fonts
```shell
$ git clone https://github.com/powerline/fonts.git
$ cd fonts
$ ./install.sh
```
change theme to 'agnoster'
```shell
$ open ~/.zshrc
Set ZSH_THEME="agnoster" and save the file
```
##### Set Powerline font
You can set any Powerline patched font you like. All the fonts end with “for Powerline”.
```shell
Open ITerm2 > Preferences > Profiles > Text > Change Font and set it to “Meslo LG DZ for Powerline” font.
```

##### Install iTerm2 “color schemes” (

Download the iTerm2-color-schemes as a zip file and extract it

```shell
git clone https://github.com/mbadolato/iTerm2-Color-Schemes
```

The “Schemes” folder contains all the color scheme files — they end with .itermcolors
```shell
Open iTerm2 > Preferences > Profile > Colors > Color Presets > Import
```
In the import window, navigate to the “Schemes” folder

Select all the files so you can import all the color schemes at once
Simply select whichever color scheme you like.

Select theme "Argonaut"

You should have a terminal that looks like this:
![alt tag](https://cdn-images-1.medium.com/max/2000/1*yFbKJQbBwNRbtU4dFM2UVA.png)

##### Add Syntax Highlighting

Clone the zsh-syntax-highlighting plugin’s repo and copy it to the “Oh My ZSH” plugins directory.
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Activate the plugin in ~/.zshrc by adding `zsh-syntax-highlighting to the Plugins section as shown below.
![alt tag](https://cdn-images-1.medium.com/max/1600/1*1sGebsi0qMQMAvPLo64ARQ.png)

##### Add ZSH-AutoSuggestion Plugin

This plugin auto suggests any of the previous commands. Pretty handy! To select the completion, simply press → key.
![alt tag](https://cdn-images-1.medium.com/max/2000/1*ZiTrbBVUGLWe4OwRL1Ytrg.gif)

Install the plugin
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
Open ~/.zshrc and add zsh-autosuggestions
![alt tag](https://cdn-images-1.medium.com/max/1600/1*pshPBacVfZgHaKdlG1cajg.png)

##### Add Cowsay, Fortune and Lolcat

Cowsay and Fortune will be installed with the Brewfile. if your running throught this prior to running the Brewfile go ahead and hit the following

```shell
$ brew install cowsay
$ brew install fortune
$ sudo gem install lolcat
```
Then head into your .zshrc file and add the config to the bottom of the file
```shell
Fortune | cowsay -f vader | lolcat
```
At the end your editor should look a little like this....
![alt tag](https://cdn-images-1.medium.com/max/800/0*7aEb1uNUHNOqBQx9.png)

#### Install official KALI linux Vagrant
https://www.kali.org/news/announcing-kali-for-vagrant/

```shell
$ cd ~/Downloads
$ vagrant init offensive-security/kali-linux
$ vagrant up
$ vagrant ssh
```

#### NANO config (the best editor ever)
```shell
nano ~/.nanorc
```
add all the below to the file
```shell
include /usr/local/share/nano/asm.nanorc
include /usr/local/share/nano/awk.nanorc
include /usr/local/share/nano/c.nanorc
include /usr/local/share/nano/cmake.nanorc
include /usr/local/share/nano/css.nanorc
include /usr/local/share/nano/debian.nanorc
include /usr/local/share/nano/fortran.nanorc
include /usr/local/share/nano/gentoo.nanorc
include /usr/local/share/nano/groff.nanorc
include /usr/local/share/nano/html.nanorc
include /usr/local/share/nano/java.nanorc
include /usr/local/share/nano/makefile.nanorc
include /usr/local/share/nano/man.nanorc
include /usr/local/share/nano/mgp.nanorc
include /usr/local/share/nano/mutt.nanorc
include /usr/local/share/nano/nanorc.nanorc
include /usr/local/share/nano/objc.nanorc
include /usr/local/share/nano/ocaml.nanorc
include /usr/local/share/nano/patch.nanorc
include /usr/local/share/nano/perl.nanorc
include /usr/local/share/nano/php.nanorc
include /usr/local/share/nano/pov.nanorc
include /usr/local/share/nano/python.nanorc
include /usr/local/share/nano/ruby.nanorc
include /usr/local/share/nano/sh.nanorc
include /usr/local/share/nano/tcl.nanorc
include /usr/local/share/nano/tex.nanorc
include /usr/local/share/nano/yaml.nanorc
include /usr/local/share/nano/go.nanorc
include /usr/local/share/nano/terraform.nanorc
include /usr/local/share/nano/cloudformation.nanorc
include /usr/local/share/nano/xml.nanor
```
Save, exit and then run 
```shell
source ~/.nanorc
```
Done, you now have Syntax highlighting in the best editor for the most common code types.

#### Git config

Make sure to replace name and email with your personal details.
```shell
git config --global user.name "yourusername"
git config --global user.email "*.******@***.***"
```

##### Generate key
```shell
ssh-keygen -t rsa -b 4096 -C "*.******@***.***"
```
##### Copy key
```shell
cat ~/.ssh/id_rsa.pub | pbcopy
```

##### Add to Github
```shell
[Github SSH keys](https://github.com/settings/ssh)
```
##### Test connection
```shell
ssh -T git@github.com
```
##### Git Cheatsheet

| COMMAND     | DESCRIPTION                                                         |
| ----------- | ------------------------------------------------------------------- |
| `clone`     | Clone a repository into a new directory                             |
| `init`      | Create an empty Git repository or reinitialize an existing one      |
| `add`       | Add file contents to the index                                      |
| `mv`        | Move or rename a file, a directory, or a symlink                    |
| `reset`     | Reset current HEAD to the specified state                           |
| `rm`        | Remove files from the working tree and from the index               |
| `log`       | Show commit logs                                                    |
| `show`      | Show various types of objects                                       |
| `status`    | Show the working tree status                                        |
| `branch`    | List, create, or delete branches                                    |
| `checkout`  | Switch branches or restore working tree files                       |
| `commit`    | Record changes to the repository                                    |
| `diff`      | Show changes between commits, commit and working tree, etc          |
| `merge`     | Join two or more development histories together                     |
| `tag`       | Create, list, delete or verify a tag object signed with GPG         |
| `pull`      | Fetch from and integrate with another repository or a local branch  |
| `push`      | Update remote refs along with associated objects                    |

##### Brew Cheatsheet

![alt tag](https://res.cloudinary.com/practicaldev/image/fetch/s--s5G3V2SE--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://www.code2bits.com/wp-content/uploads/cheatsheet-image/cheatsheet-homebrew.png)