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

### Install
```sh
git clone --depth 1 https://github.com/kojandy/.dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./setup
chsh -s $(which zsh)
```

### Recommended
- `tmux`: a terminal multiplexer
- [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern
- [autojump](https://github.com/wting/autojump): A cd command that learns - easily navigate directories from the command line
- [asciinema](https://asciinema.org): Record and share your terminal sessions, the right way.

## Scripts
### dfm
`dfm` is a dotfile manager. Each command can be used with `-h` flag for more information.

- `dfm link`: creates symlinks of files with '@' endings to your home directory. (`ln -s`)
  - If specified file is not found on your dotfiles directory, it moves the file to your dotfiles directory and creates a symlink to your home directory. (`mv && ln -s`)
  - If specified file already exists, it checks whether the two files are identical. (`rm && ln -s`)
  - If both files are not symlinks and both are different, it skips the file.
- `dfm unlink`: replaces linked files with the original copy. (`rm && cp`)
  - useful with temporary machine-dependent fixes.
- `dfm remove`: removes symlinks. (`rm`)
- `dfm update`: updates dotfiles. (`git pull`)
- `dfm install`: runs specified install commands in `dfmconfig`.
- `dfm test`: runs pre-defined test commands in `dfmconfig`.

## Customization
### Things you might want to change
- [`gitconfig`](gitconfig@)

### Placing dotfiles in a different directory
You can change the default location of the dotfiles by just changing `$DOTFILES` in [`zshrc`](zshrc@).
