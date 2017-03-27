![alt tag](https://coolestguidesontheplanet.com/wp-content/uploads/2013/12/home-brew-osx-lion-package-manager.png)

# BrewSetup for your MAC OSX system

Why spend time downloading pesky installers form the web,
Just run this guy, grab a coffee and come back to a fully setup Mac for development and Security testing 

Approximate setup time is roughly 1-lhour 

NOTE there are four applications that require authentication (left to the end)

```
xquartz
wireshark
parallels-desktop
virtualbox
```

### Prerequisites

You need the following

```
Xcode 
HomeBrew
```

### Installing

Installing xCode
```
$ xcode-select --install
```
Install HomeBrew

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Running through the homebrew setup steps

Check brew works

```
$ brew doctor
```
Update brew

```
$ brew update
```
Upgrade brew

```
$ brew upgrade
```

## Deployment

```
$ chmod a+x /path to file/brewsetupformac.sh
```

Run with

```
$ ./brewsetupformac.sh
```


The script is relevant as of March 2017

Any additional packages should be added under the core .sh with there category 

## Further Development

Integrate more security apps and function for OSX from 

https://kakkulearning.wordpress.com/2014/05/22/use-mac-os-x-hackers-toolbox/

## Authors

* **T0mmyKn1fe** - [T0mmyKn1fe](https://github.com/t0mmykn1fe)