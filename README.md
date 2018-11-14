# kojandy's dotfiles

![Screenshot](screenshot.png)

## Try
```sh
docker run -it --rm kojandy/dotfiles
```

## Installation
### Dependencies
- `curl`
- `git`
- `python3`
- `vim`
- `zsh`

### Recommended
- `tmux`: a terminal multiplexer
- [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern
- [autojump](https://github.com/wting/autojump): A cd command that learns - easily navigate directories from the command line

### Install
```sh
git clone https://github.com/kojandy/.dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./setup
```

## Customization
### Things you might want to change
- [`gitconfig`](gitconfig@)

### Place dotfiles in a different directory
You can change the default location of the dotfiles by just changing `$DOTFILES` in [`zshrc`](zshrc@).
