# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# Git branch in prompt.
force_color_prompt=yes  # Bash
export EDITOR=vim
#if [ "$force_color_prompt" = yes ]; then
##PS1="\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
#PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\][\t] \[\033[01;33m\]\u:\w\$\[\033[01;37m\] '  
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias gg='git grep'
# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by Anaconda3 4.4.0 installer
export PATH="/home/adam/anaconda3/bin:$PATH"

# z-file
. ~/z-master/z.sh

# Aliases
alias runint='RUN_INTEGRATIONS=akjsdn'
alias be='bundle exec'
alias berc='bundle exec rails c'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glp='git log --oneline --all --graph --decorate'
alias gco='git checkout'
alias weather='curl wttr.in/stockport'
alias catchup='git fetch --all && git rebase upstream/master'
alias branches="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias befs="bundle exec foreman start"
alias bep="bundle exec puma -e development -C config/puma.rb"
alias beu="bundle exec unicorn -c config/unicorn.rb -E development"
# Load RVM into a shell session *as a function*

export NVM_DIR="/home/adam/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Function to download and play a session video given the session_id
session_video () {
  wget  "http://selenium-hub.otbeach.com:3000/download_video/$1.mp4"
  totem "./$1.mp4"
  rm "./$1.mp4"
}

export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/build-tools"
export PATH="$PATH:$ANDROID_HOME/tools" 
export PATH="$PATH:$ANDROID_HOME/platform-tools"                                  

## rvm
PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
alias config='/usr/bin/git --git-dir=/home/adam/.cfg/ --work-tree=/home/adam'
