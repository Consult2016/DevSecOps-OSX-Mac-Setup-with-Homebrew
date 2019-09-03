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

### Show hidden files

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

#### Save Screenshots to alternative folder

I usually use this command after installing every application that I need - it keeps Apple applications on the first page and moves the rest to the next pages.

```shell
$ defaults write com.apple.screencapture location ~/Pictures/screenshots
$ killall SystemUIServer
```

#### Set Firmware Password

Setting a firmware password prevents your Mac from starting up from any device other than your startup disk. It may also be set to be required on each boot.

```shell
$ sudo firmwarepasswd -setpasswd
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

#### VS Code settings.json

```shell
{
    "workbench.colorTheme": "One Monokai",
    "workbench.iconTheme": "material-icon-theme",
    "window.zoomLevel": -1,
    "editor.fontSize": 14,
    "terminal.integrated.fontSize": 14,
    "cSpell.userWords": [
        "ASLAN"
    ],
    "sync.gist": "ebe2a177355d820e0cfc7faa62a26b23",
    "python.pythonPath": "/usr/local/bin/python3",
    "python.jediEnabled": false,
    "spellright.language": [
        "en"
    ],
    "spellright.documentTypes": [
        "markdown",
        "latex",
        "plaintext",
        "python"
    ],
    "git-autoconfig.configList": [
        {},
        {
            "user.email": "foo@foo.com",
            "user.name": "foo"
        }
    ],
    "vs-kubernetes": {
        "vs-kubernetes.draft-path": "/Users/foo/.vs-kubernetes/tools/draft/darwin-amd64/draft",
        "vs-kubernetes.helm-path": "/Users/foo/.vs-kubernetes/tools/helm/darwin-amd64/helm",
        "vs-kubernetes.minikube-path": "/Users/foo/.vs-kubernetes/tools/minikube/darwin-amd64/minikube",
        "vs-kubernetes.kubectl-path": "/Users/foo/.vs-kubernetes/tools/kubectl/kubectl"
    }
}
```

#### ZSH config 
oh my ZSH

```shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
Lets change the theme now
You can browse all the “Oh My ZSH” Themes here. To change the Theme, simply change the ZSH_THEME value in ~/.zshrc file from robbyrussell to Avit.
Run the following command to update the config.
```shell
$ source ~/.zhrc
```
Lets add some backround config with Iterm
```shell
Open ITerm2 > Preferences > Profiles > Colors and change the background black color to use 20% gray
```

#### Really JAZZ up your ZSH Terminal 

Settings for ITerm JSON here
```JSON
{
  "Ansi 3 Color" : {
    "Green Component" : 0.72656995058059692,
    "Red Component" : 1,
    "Blue Component" : 0
  },
  "Tags" : [

  ],
  "Ansi 12 Color" : {
    "Green Component" : 0.5733030673510271,
    "Red Component" : 0.00053359762918048226,
    "Blue Component" : 1
  },
  "Ansi 7 Color" : {
    "Green Component" : 1,
    "Red Component" : 1,
    "Blue Component" : 1
  },
  "Ansi 8 Color" : {
    "Green Component" : 0.26696832579185525,
    "Red Component" : 0.26696832579185525,
    "Blue Component" : 0.26696832579185525
  },
  "Bold Color" : {
    "Green Component" : 0.6100342869758606,
    "Red Component" : 0.61956524848937988,
    "Blue Component" : 0.60246169567108154
  },
  "Ansi 9 Color" : {
    "Green Component" : 0.15470406080870669,
    "Red Component" : 1,
    "Blue Component" : 0.24923402424592656
  },
  "Horizontal Spacing" : 1,
  "Right Option Key Sends" : 0,
  "Rows" : 25,
  "Default Bookmark" : "No",
  "Cursor Guide Color" : {
    "Red Component" : 0.70213186740875244,
    "Color Space" : "sRGB",
    "Blue Component" : 1,
    "Alpha Component" : 0.25,
    "Green Component" : 0.9268307089805603
  },
  "Non-ASCII Anti Aliased" : true,
  "Use Bright Bold" : true,
  "Ansi 10 Color" : {
    "Green Component" : 0.88189995290000001,
    "Red Component" : 0.67126059688058637,
    "Blue Component" : 0.35646489677720017
  },
  "Ambiguous Double Width" : false,
  "Jobs to Ignore" : [
    "rlogin",
    "ssh",
    "slogin",
    "telnet"
  ],
  "Ansi 15 Color" : {
    "Green Component" : 1,
    "Red Component" : 1,
    "Blue Component" : 1
  },
  "Foreground Color" : {
    "Green Component" : 0.98048108816146851,
    "Red Component" : 1,
    "Blue Component" : 0.95548701286315918
  },
  "Working Directory" : "\/Users\/tcockin",
  "Blinking Cursor" : true,
  "Disable Window Resizing" : true,
  "Sync Title" : false,
  "Prompt Before Closing 2" : false,
  "BM Growl" : true,
  "Command" : "\/bin\/zsh",
  "Description" : "Default",
  "Mouse Reporting" : true,
  "Screen" : -1,
  "Selection Color" : {
    "Green Component" : 0.16498950123786926,
    "Red Component" : 0,
    "Blue Component" : 0.23076923191547394
  },
  "Columns" : 80,
  "Idle Code" : 0,
  "Ansi 13 Color" : {
    "Green Component" : 0.37417232689266022,
    "Red Component" : 0.60504487800788187,
    "Blue Component" : 0.92307692307692313
  },
  "Custom Command" : "Yes",
  "ASCII Anti Aliased" : true,
  "Non Ascii Font" : "Monaco 12",
  "Vertical Spacing" : 1,
  "Use Bold Font" : true,
  "Option Key Sends" : 0,
  "Selected Text Color" : {
    "Green Component" : 1,
    "Red Component" : 1,
    "Blue Component" : 1
  },
  "Background Color" : {
    "Red Component" : 0.10000000000000001,
    "Color Space" : "sRGB",
    "Blue Component" : 0.10000000000000001,
    "Alpha Component" : 1,
    "Green Component" : 0.10000000000000001
  },
  "Character Encoding" : 4,
  "Ansi 11 Color" : {
    "Green Component" : 0.82281720845913986,
    "Red Component" : 1,
    "Blue Component" : 0.25792301594327316
  },
  "Use Italic Font" : true,
  "Unlimited Scrollback" : false,
  "Keyboard Map" : {
    "0xf700-0x260000" : {
      "Action" : 10,
      "Text" : "[1;6A"
    },
    "0x37-0x40000" : {
      "Action" : 11,
      "Text" : "0x1f"
    },
    "0x32-0x40000" : {
      "Action" : 11,
      "Text" : "0x00"
    },
    "0xf709-0x20000" : {
      "Action" : 10,
      "Text" : "[17;2~"
    },
    "0xf70c-0x20000" : {
      "Action" : 10,
      "Text" : "[20;2~"
    },
    "0xf729-0x20000" : {
      "Action" : 10,
      "Text" : "[1;2H"
    },
    "0xf72b-0x40000" : {
      "Action" : 10,
      "Text" : "[1;5F"
    },
    "0xf705-0x20000" : {
      "Action" : 10,
      "Text" : "[1;2Q"
    },
    "0xf703-0x260000" : {
      "Action" : 10,
      "Text" : "[1;6C"
    },
    "0xf700-0x220000" : {
      "Action" : 10,
      "Text" : "[1;2A"
    },
    "0xf701-0x280000" : {
      "Action" : 11,
      "Text" : "0x1b 0x1b 0x5b 0x42"
    },
    "0x38-0x40000" : {
      "Action" : 11,
      "Text" : "0x7f"
    },
    "0x33-0x40000" : {
      "Action" : 11,
      "Text" : "0x1b"
    },
    "0xf703-0x220000" : {
      "Action" : 10,
      "Text" : "[1;2C"
    },
    "0xf701-0x240000" : {
      "Action" : 10,
      "Text" : "[1;5B"
    },
    "0xf70d-0x20000" : {
      "Action" : 10,
      "Text" : "[21;2~"
    },
    "0xf702-0x260000" : {
      "Action" : 10,
      "Text" : "[1;6D"
    },
    "0xf729-0x40000" : {
      "Action" : 10,
      "Text" : "[1;5H"
    },
    "0xf706-0x20000" : {
      "Action" : 10,
      "Text" : "[1;2R"
    },
    "0x34-0x40000" : {
      "Action" : 11,
      "Text" : "0x1c"
    },
    "0xf700-0x280000" : {
      "Action" : 11,
      "Text" : "0x1b 0x1b 0x5b 0x41"
    },
    "0x2d-0x40000" : {
      "Action" : 11,
      "Text" : "0x1f"
    },
    "0xf70e-0x20000" : {
      "Action" : 10,
      "Text" : "[23;2~"
    },
    "0xf702-0x220000" : {
      "Action" : 10,
      "Text" : "[1;2D"
    },
    "0xf703-0x280000" : {
      "Action" : 11,
      "Text" : "0x1b 0x1b 0x5b 0x43"
    },
    "0xf700-0x240000" : {
      "Action" : 10,
      "Text" : "[1;5A"
    },
    "0xf707-0x20000" : {
      "Action" : 10,
      "Text" : "[1;2S"
    },
    "0xf70a-0x20000" : {
      "Action" : 10,
      "Text" : "[18;2~"
    },
    "0x35-0x40000" : {
      "Action" : 11,
      "Text" : "0x1d"
    },
    "0xf70f-0x20000" : {
      "Action" : 10,
      "Text" : "[24;2~"
    },
    "0xf703-0x240000" : {
      "Action" : 10,
      "Text" : "[1;5C"
    },
    "0xf701-0x260000" : {
      "Action" : 10,
      "Text" : "[1;6B"
    },
    "0xf702-0x280000" : {
      "Action" : 11,
      "Text" : "0x1b 0x1b 0x5b 0x44"
    },
    "0xf72b-0x20000" : {
      "Action" : 10,
      "Text" : "[1;2F"
    },
    "0x36-0x40000" : {
      "Action" : 11,
      "Text" : "0x1e"
    },
    "0xf708-0x20000" : {
      "Action" : 10,
      "Text" : "[15;2~"
    },
    "0xf701-0x220000" : {
      "Action" : 10,
      "Text" : "[1;2B"
    },
    "0xf70b-0x20000" : {
      "Action" : 10,
      "Text" : "[19;2~"
    },
    "0xf702-0x240000" : {
      "Action" : 10,
      "Text" : "[1;5D"
    },
    "0xf704-0x20000" : {
      "Action" : 10,
      "Text" : "[1;2P"
    }
  },
  "Window Type" : 0,
  "Cursor Boost" : 0,
  "Cursor Type" : 0,
  "Background Image Location" : "",
  "Blur" : false,
  "Badge Color" : {
    "Red Component" : 1,
    "Color Space" : "sRGB",
    "Blue Component" : 0,
    "Alpha Component" : 0.5,
    "Green Component" : 0.1491314172744751
  },
  "Scrollback Lines" : 1000,
  "Send Code When Idle" : false,
  "Close Sessions On End" : true,
  "Terminal Type" : "xterm-256color",
  "Visual Bell" : true,
  "Flashing Bell" : false,
  "Silence Bell" : false,
  "Ansi 14 Color" : {
    "Green Component" : 1,
    "Red Component" : 0.4042010611351281,
    "Blue Component" : 0.94094775504779782
  },
  "Name" : "Default",
  "Cursor Text Color" : {
    "Green Component" : 0,
    "Red Component" : 1,
    "Blue Component" : 0.0940093994140625
  },
  "Minimum Contrast" : 0.42453835227272729,
  "Shortcut" : "",
  "Cursor Color" : {
    "Green Component" : 0,
    "Red Component" : 1,
    "Blue Component" : 0.0940093994140625
  },
  "Ansi 0 Color" : {
    "Green Component" : 0.13574660633484159,
    "Red Component" : 0.13574660633484159,
    "Blue Component" : 0.13574660633484159
  },
  "Transparency" : 0,
  "Ansi 2 Color" : {
    "Green Component" : 0.88189995288848877,
    "Red Component" : 0.54928803443908691,
    "Blue Component" : 0.04123397171497345
  },
  "Custom Directory" : "No",
  "Ansi 4 Color" : {
    "Green Component" : 0.55481654405593872,
    "Red Component" : 0,
    "Blue Component" : 0.97294086217880249
  },
  "Ansi 5 Color" : {
    "Green Component" : 0.26314744353294373,
    "Red Component" : 0.42564234137535095,
    "Blue Component" : 0.65052211284637451
  },
  "Use Non-ASCII Font" : false,
  "Ansi 6 Color" : {
    "Green Component" : 0.84575581550598145,
    "Red Component" : 0,
    "Blue Component" : 0.92260181903839111
  },
  "Normal Font" : "MesloLGMForPowerline-Regular 14",
  "Link Color" : {
    "Red Component" : 0,
    "Color Space" : "sRGB",
    "Blue Component" : 0.73423302173614502,
    "Alpha Component" : 1,
    "Green Component" : 0.35916060209274292
  },
  "Guid" : "457B9CFC-16FA-4238-9DA8-A922C6C0B15A",
  "Ansi 1 Color" : {
    "Green Component" : 0,
    "Red Component" : 1,
    "Blue Component" : 0.058871746063232422
  }
}
```

##### Install Powerline fonts
```shell
$ cd ~/.oh-my-zsh
$ git clone https://github.com/powerline/fonts.git
$ cd fonts
./install.sh
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

Credit to Adam https://medium.com/@Jarvski/customizing-the-os-x-terminal-11fda5c3dd5c2
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

![alt tag](https://thecustomizewindows.com/wp-content/uploads/2015/01/Nano-Syntax-Highlighting-nanorc.png)

Scopatz has an AWESOME guide to Pimping your NANO out
```shell
https://github.com/scopatz/nanorc
```
####Automatic Installers 
Automatic installer
Finally, you can run an automatic installer using the following code:
```shell
$ curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
```
or alternatively:
```shell
$ wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
```

####Manual config
#####Copy Files
These should be placed inside of the ~/.nano/ directory. Or for system-wide installation /usr/share/nano-syntax-highlighting/. In other words:
```shell
git clone git@github.com:scopatz/nanorc.git ~/.nano
```
Note - if you have any issues (ssh was not properly configured), alternatively use:
```shell
git clone https://github.com/scopatz/nanorc.git ~/.nano
```
System wide will look like so:
```shell
sudo git clone https://github.com/scopatz/nanorc.git /usr/share/nano-syntax-highlighting/
```
#####Configure nano
Once there you should add the languages you want to your nano configuration file ~/.nanorc. For example:
```shell
## C/C++
include "~/.nano/c.nanorc"
```
You can also append the contents of ~/.nano/nanorc into your ~/.nanorc to include all languages:
```shell
cat ~/.nano/nanorc >> ~/.nanorc
```
Or to be less verbose, append content of the folder in one line with wildcard:
```shell
## For all users
$ echo "include $install_path/*.nanorc" >> /etc/nanorc
## For current user
$ echo "include $install_path/*.nanorc" >> ~/.nanorc
```
where $install_path is /usr/share/nano-syntax-highlighting or ~/.nano/ or ...

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
