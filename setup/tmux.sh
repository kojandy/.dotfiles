mv -f ~/.tmux.conf ~/dotfiles/dotfiles_old/tmux.conf
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

if [ ! -d ~/.tmux/plugins/tpm ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
