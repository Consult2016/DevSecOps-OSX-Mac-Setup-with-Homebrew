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
## Enjoy!

#### FIXS ISSUES 

##### Brew Cheatsheet

![alt tag](https://res.cloudinary.com/practicaldev/image/fetch/s--s5G3V2SE--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://www.code2bits.com/wp-content/uploads/cheatsheet-image/cheatsheet-homebrew.png)