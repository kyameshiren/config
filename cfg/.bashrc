# Trash
trash="$HOME/.trash"
if [ ! -d "$trash" ]; then
    mkdir -p "$trash"
fi

# Alias
alias gl='git log --graph --oneline --all'
alias ls='ls -F --color=auto'
alias lc='clear'
alias ll='ls -lhF'
alias la='ls -alhF'
alias rm="mv --backup=numbered --target-directory=$trash"
alias cltrash="/usr/bin/rm -rf ${trash}/*"
alias gitforce='git add . && git commit --amend --no-edit && git push --force-with-lease origin master'

function ip4() {
        ip -4 -o a | awk '{print $2, $4}'
}

function sk() {
        find /etc /home /root /usr /var -name "$1" 2> /dev/null
}

# Set cd to auto-ls
function cd() {
        new_directory="$*";
        if [[ "$#" -eq 0 ]]; then
                new_directory="$HOME";
        fi;
        builtin cd "$new_directory" && ls --color=auto
}

# Set Prompt and Colors
function parse_git_branch() {
        git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function new_line() {
        printf "\n$ "
}

PS1="\[\033[1;31m\][\u@\h]\[\033[0m\]\w\[\033[1;31m\]\$(parse_git_branch) \[\033[0m\] $(new_line)"
export PS1

# Set VIM
export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist noma' -\""
export MANWIDTH=80
