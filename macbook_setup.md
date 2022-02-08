This is a personal checklist of stuff I do on every new macbook:

# SSH Key for Git

```bash
ssh-keygen  # Call it ~/.ssh/id_rsa_{website}
ssh-add ~/.ssh/id_rsa_{website}
mkdir -p ~/.ssh
vim ~/.ssh/config

# Config looks like:

Host {website}
  HostName {website fqdn}
  IdentityFile ~/.ssh/id_rsa_{website}

```


# Fonts and Colors

Fonts:

- Dank Mono
- MonaLisa
- FiraCode NF

Colors:

- Earthy
- Dark One
- Gruvbox
- Smooooth


# Apps

[Brew](https://brew.sh/):

```bash
brew install bash bottom curl docker docker-compose exa fzf git grep htop hyperkit jq minikube node openjdk pyenv python@3.10 ripgrep tree vim
```

Non-brew:

- Archiver (Zettel)
- Marked 2
- DBeaver
- iStat Menus
- Tidal
- Chrome
- Firefox
- iTerm 2
- IntelliJ
- PyCharm
- Insomnia

Non-brew CLI Apps:

- pyenv
- nvm

Zshell Plugins:

- zsh-autosuggestions
- zsh-syntax-highlighting


# IDE Settings

Plugins:

- vim
- rainbow csv/brackets/tabs
- git


# Chrome Plugins

- Marinara Pomodoro: Assistant
- AdBlock (NOT Plus)
- Momentum


