![alt tag](https://coolestguidesontheplanet.com/wp-content/uploads/2013/12/home-brew-osx-lion-package-manager.png)

# BrewSetup for your DevOps and Security testing MAC

Why spend time downloading pesky installers form the web,
Just run this guy, grab a coffee and come back to a fully setup Mac for DevOps and Security testing 

Approximate setup time is roughly 1-hour 

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