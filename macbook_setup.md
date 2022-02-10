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
- Screry


# Apps

[Brew](https://brew.sh/):

```bash
brew install bash bottom curl docker docker-compose exa fzf git grep htop hyperkit jq minikube node openjdk pyenv python@3.10 ripgrep tree vim
```

Non-brew:

- The Archive (Zettel) <https://zettelkasten.de/the-archive/>
- Marked 2 <https://marked2app.com/>
- DBeaver <https://dbeaver.io/download/>
- iStat Menus <https://bjango.com/mac/istatmenus/>
- Tidal <https://offer.tidal.com/download>
- Chrome
- Firefox
- Kitty <https://sw.kovidgoyal.net/kitty/binary/>
- IntelliJ
- PyCharm
- Insomnia <https://insomnia.rest/download>

Non-brew CLI Apps:

- pyenv
- nvm

Zshell Plugins:

- zsh-autosuggestions
    - <https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md>

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting
    - <https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md>

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


Vim:

- vundle <https://github.com/VundleVim/Vundle.vim>

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```


# IDE Settings

Plugins:

- vim
- rainbow csv/brackets/tabs
- git


# Chrome Plugins

- Marinara Pomodoro: Assistant
- AdBlock (NOT Plus)
- Momentum


