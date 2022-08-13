# .dotfiles

## Dependencies
- GNU stow
- Neovim>=0.6.0

## Setup
```shell
git clone git@github.com:hexdhog/.dotfiles.git ~/.dotfiles
```

### ZSH
```shell
cd $HOME
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
cd -
cp $HOME/.dotfiles/resources/zsh/.oh-my-zsh/themes/* $HOME/.oh-my-zsh/themes/
```

### Startup
```shell
sudo envsubst < $HOME/.dotfiles/resources/startup/com.startup.plist > $HOME/com.startup.plist
sudo cp $HOME/com.startup.plist /Library/LaunchDaemons/com.startup.plist
sudo chown root:wheel /Library/LaunchDaemons/com.startup.plist
sudo launchctl load /Library/LaunchDaemons/com.startup.plist
```

### Install
```shell
cd $HOME/.dotfiles
./install.sh
```
