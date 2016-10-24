platform=$(uname)

mkdir -p ~/dotfiles/dotfiles_old
mv -f ~/.vimrc ~/dotfiles/dotfiles_old/vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc

if [ $platform = 'Linux' ]
then
    sudo apt install vim
    sudo apt install zsh
    sudo cp -n ~/dotfiles/fonts/Source\ Code\ Powerline\ Medium.otf /usr/share/fonts/Source\ Code\ Powerline\ Medium.otf
fi
if [ $SHELL != $(which zsh) ]
then
    chsh -s $(which zsh)
fi
if [ ! -d ~/.oh-my-zsh ]
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
mv -f ~/.zshrc ~/dotfiles/dotfiles_old/zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/oh-my-zsh/custom/themes ~/.oh-my-zsh/custom/themes
