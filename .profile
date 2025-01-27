
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

PS2="  \[\e[5m\]…\[\e[0m\] "

if [ "$(uname)" == "Darwin" ]; then

    ls_color="-G"

    PS1="\$? \w :: "
    export PATH=/usr/local/git/bin:/usr/local/sbin:$PATH

    # Ignore warnings about zsh default in Catalina
    export BASH_SILENCE_DEPRECATION_WARNING=1

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

    ls_color="--color=always"

    PS1="\$? $(cat ~/.hostname) \w x "
else
    ls_color=""
    PS1="\$? \h \w ~ "
fi

export HISTTIMEFORMAT="%y-%m-%d %T "
export ANSIBLE_HOST_KEY_CHECKING=False 
export EDITOR=$(which vim)
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


alias lsc='ls -lh $ls_color'
alias grep='grep --color'
alias wrap='tput smam'
alias nowrap='tput rmam'
alias passrandom="pwgen -s -y 32 1"

alias sudols="sudo ls -lh $ls_color"
alias sudovim='sudo vim -u ~/.vimrc'
alias sudovimr='sudo vim -R -u ~/.vimrc'

alias py2='source ~/workspace/venv/bin/activate'
alias py3='source ~/workspace/venv3/bin/activate'
alias pyAnsible='source ~/workspace/venv-ansible/bin/activate'
alias hey='sudo'

alias gittrim='git branch -d $(git branch --merged=master | grep -v master) && git fetch --prune'
alias activate='source .venv/bin/activate'

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

gitbranch() {
    B=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [[ "" != "$B" ]]; then
        printf "[$B]"
    fi
}

sssh() {
    scp ~/.profile $1:
    scp ~/.vimrc $1:
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

mann() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
. "$HOME/.cargo/env"
