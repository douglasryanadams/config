
# This is sourced from a lot of places and though most pieces have been customized credit for the contents of this file
# goes to many people, websites, and frustrating configurations I've encountered over the years. Please take what you
# like from this file.
#
# DISCLAIMER: I am not responsible for any harm that using this file, or any pieces of this file, may cause the system
# you use it on.
#


# Include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# Set my path to include ~/bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# If I'm in a directory with a Python Virtual Environment, use it
if [ -d "venv" ]; then
    source venv/bin/activate
fi

java_exists=$(which java)
if [ "$(uname)" == "Darwin" ]; then

    ls_color="-G"

    if [ "" != "$java_exists" ]; then
        export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    fi

    export PATH=/usr/local/git/bin:$PATH
    PS1="-\[\e[31m\]\$?\[\e[m\]- <\[\e[0;37m\]\u\[\e[m\]> \[\e[0;33m\]\w\[\e[m\] : "

    if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

    ls_color="--color=always"

    if [ "" != "$java_exists" ]; then
        export JAVA_HOME='/usr/lib/jvm/default-java'
    fi
    PS1="-\[\e[31m\]\$?\[\e[m\]- <\[\e[1;37m\]\u\[\e[m\]> \[\e[0;31m\]\h\[\e[m\]|\[\e[0;31m\]\w\[\e[m\] : "

else

    ls_color=""
    PS1="-\[\e[31m\]\$?\[\e[m\]- <\[\e[1;37m\]\u\[\e[m\]> \[\e[1;36m\]\H\[\e[m\]|\[\e[0;31m\]\w\[\e[m\] : "

fi

export ANSIBLE_HOST_KEY_CHECKING=False 
export EDITOR=$(which vim)
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


alias lsc='ls -lh $ls_color'
alias grep='grep --color'
alias wrap='tput smam'
alias nowrap='tput rmam'
alias pp='python -m json.tool'
alias mine='git update-index --assume-unchanged'
alias download_site="wget -r -k -p"
alias statservices="ls /etc/init.d | xargs -I{} service {} status"

gitstat() {
    for d in *;do 
        cd "$d"
        pwd
        git status
        cd ..
        echo
        echo
    done
}

gitpull() {
    for d in *;do 
        cd "$d"
        pwd
        git pull
        cd ..
        echo
        echo
    done
}

sssh() {
    cat $HOME/.ssh/id_rsa.pub | ssh $1 "cat > authorized_keys; mkdir -p .ssh; chmod 0700 .ssh; mv authorized_keys .ssh; chmod 0600 .ssh/authorized_keys"
    scp ~/.profile $1:
    ssh $1
}

lsf() {
    $2 ls -l $1 | tail -n +2 | awk '{printf "%-11.11s|%4.4s: %s\n",$1,$3,$9}' | column -c 160
}

gateways() {
OLDIFS=$IFS
IFS='
'
    for line in $($1 ip route show); do
        if [[ "$line" =~ "via" ]]; then
            echo $line | awk '{printf "%19.19s : %s\n",$1,$3 }'
        fi
    done
IFS=$OLDIFS
}

iplist() {
OLDIFS=$IFS
IFS='
'

    for line in $($1 ip addr show); do
        if [[ "$line" =~ "BROADCAST" ]]; then
             echo $line | awk '{print $2}'
             continue
        fi
        if [[ "$line" =~ "inet " && "$line" =~ "global" ]]; then
             echo $line | awk '{printf "  %9.9s - %s\n",$7,$2 }'
             continue
        fi
    done

IFS=$OLDIFS
}

specs() {
    echo "CPU Cores: $(cat /proc/cpuinfo | grep "model name" | wc -l)"
    echo "RAM MB   : $(free -m | grep Mem| awk '{print $2 }')"
    echo "HDD Size : $(df -h | grep sda1 | awk '{print $2 }')"
}

alias netinfo='echo "Gateways:";echo;gateways;echo;echo "IP Addresses:";echo;iplist;echo;'

list () {
    for x in *; do
        ((d = current_depth * 4))
        if [ "*" != "$x" ]; then
            printf "%-${d}s" " "
            printf "%s\n" "$x"
        fi
        if [ -d "$x" ]; then
            ((current_depth++))
            cd "$x"
            list "$x"
            cd ..
            ((current_depth--))
        fi
    done
}

trees () {
current_depth=0
list
}

encrypt () {
    openssl aes-256-cbc -a -salt -in $1 -out $1.encrypted && rm $1
}

decrypt () {
    openssl aes-256-cbc -d -a -in $1 -out ${1%".encrypted"} && rm $1
}

# Makes it easy to bring my ~/.vimrc with me via sssh
echo "
syntax enable
filetype plugin on

set autoindent
set smartindent
set number
set modeline
set expandtab
set nowrap

set ls=2
set tabstop=4
set shiftwidth=4
set textwidth=120
set foldlevel=99
set backspace=indent,eol,start
set fdm=indent
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set laststatus=2
set t_Co=256

au BufNewFile,BufRead *.sls set ft=yaml
au BufNewFile,BufRead *.play set ft=yaml
au BufNewFile,BufRead *.task set ft=yaml
au BufNewFile,BufRead *.json set ft=javascript
" > ~/.vimrc

# For iterm3
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
