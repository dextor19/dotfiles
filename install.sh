if [[ `uname -v` =~ "Ubuntu" ]]; then
      apt-get update
        apt-get install -y zsh git stow neovim tmux fzf
fi

stow -t $HOME zsh git nvim tmux

# oh-my-zsh for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# vim-plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

OS=`uname -s`
if [ "$OS" == "Darwin"]; then
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zsh/macos/.zshrc ~/.zshrc
fi

