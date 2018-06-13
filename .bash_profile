source ~/.bashrc
source ~/.profile

export EDITOR=vim
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[37m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH="/home/adam/.linuxbrew/sbin:$PATH"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
