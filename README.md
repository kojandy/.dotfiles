# kojandy's dotfiles

## Try
```sh
docker run -it --rm kojandy/dotfiles
```

## Installation
### Install
```sh
git clone --depth 1 https://github.com/kojandy/.dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./setup
chsh -s $(which zsh)
```

### Recommended
- `tmux`: a terminal multiplexer
- [ripgrep](https://github.com/BurntSushi/ripgrep): recursively searches directories for a regex pattern
- [autojump](https://github.com/wting/autojump): A cd command that learns - easily navigate directories from the command line
- [asciinema](https://asciinema.org): Record and share your terminal sessions, the right way.
- [nnn](https://github.com/jarun/nnn): one of the fastest and most lightweight file managers

## Customization
### Things you might want to change
- [`gitconfig`](git/gitconfig)

### Placing dotfiles in a different directory
You can change the default location of the dotfiles by just changing `$DOTFILES` in [`profile`](profile).
