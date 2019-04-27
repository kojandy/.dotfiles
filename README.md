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

## Customization
### Things you might want to change
- [`gitconfig`](git/gitconfig)

### Placing dotfiles in a different directory
You can change the default location of the dotfiles by just changing `$DOTFILES` in [`profile`](profile).
