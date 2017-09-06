# Vic
My Ansible Playbooks to install and config my emacs, tmux, vim, git, zsh, etc aimed at working in Linux & OSX.



## Instalation

### Clone

```bash
  git clone --recursive git@github.com:victorvoid/vic.git
```
### Install


```bash
./install        # installs everything on the local machine
```

## Usage

```bash
./install [options] [roles...]
Supported options:
  -f/--force
  -h/--help
  -v/--verbose (repeat for more verbosity)
Other options (passed through to Ansible):
  --check
  --step
  --tags="role"
Supported roles:
  defaults
    Install defaults apps.
  docker
    Install docker and docker-compose.
  dotfiles
    Creates symlinks in $HOME to the dotfiles in this repo
  spotify
    Install spotify client
  telegram
    Install telegram client
```

### Apps availables

- Docker
- Spotify
- Telegram
- Vim
- Emacs
- Zsh

### Install specific role

You can use the same role name

```bash
sudo ./install --tags="telegram"
```

Authors
--------
The repo is written and maintained by [Victor Igor](https://github.com/victorvoid). Other contributors that have submitted  something, in alphabetical order:

- [Claick Oliveira](https://github.com/claick-oliveira)

License
-------

The code is available under the [MIT License](LICENSE.md).
