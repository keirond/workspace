### Install Zsh
```shell
sudo apt update
sudo apt install zsh -y
sudo apt install git neovim -y
[ ! -d "$HOME/.oh-my-zsh" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Custom Zsh
```shell
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
```

### Config Zsh 
```shell
cp -rf "workspace/keiron.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/keiron.zsh-theme"
cp -rf "workspace/.zshrc" "$HOME/.zshrc"
rm -rf ~/.bash*
rm -rf ~/.profile
rm -rf ~/.zcomp*
rm -rf ~/.shell.pre-oh-my-zsh
source "$HOME/.zshrc"
```

### Other Configs
```shell
cp -f "workspace/.gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.config/nvim" && cp -f "workspace/.vimrc" "$HOME/.config/nvim/init.vim"
cp -f "workspace/.clang-format" "$HOME/.clang-format"
cp -f "workspace/.gdbinit" "$HOME/.gdbinit"
```

### C++ Scripts
```shell
mkdir -p "$HOME/.local/bin/"
cp -f workspace/bin/* "$HOME/.local/bin/"
```