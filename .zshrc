# Use the default config, them overwrite it.
. ~/.oh-my-zsh/templates/zshrc.zsh-template

ZSH_THEME="maran"
DISABLE_CORRECTION="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git svn python colored-man tmux git-flow)

WORK_DIR="$HOME/.dotfiles/"
PRE_CUSTOM="${WORK_DIR}/custom/pre_custom.zsh"
if [ -e "${PRE_CUSTOM}" ]; then
    source ${PRE_CUSTOM}
fi

autoload -U compinit
compinit
setopt correctall
autoload -U promptinit
promptinit

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source ~/.zplug/init.zsh
zplug "~/.zsh", from:local
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "Jxck/dotfiles"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

#zplug load --verbose
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

[[ -s "$HOME/.qfc/bin/qfc.sh"  ]] && source "$HOME/.qfc/bin/qfc.sh"

# disable CTRL+S from sending XOFF
stty ixany
stty ixoff -ixon

# rbenv; Octopress
if command -v rbenv 2>/dev/null; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

# rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# virtualenvwrapper
# default $WORKON_HOME is ~/.virtualenvs after source virtualenvwrapper.sh
#export WORKON_HOME=~/Envs
VIRTUALENVWRAPPER_UBUNTU="/usr/local/bin/virtualenvwrapper.sh"
VIRTUALENVWRAPPER_GENTOO="/usr/bin/virtualenvwrapper.sh"
if [ -e "${VIRTUALENVWRAPPER_UBUNTU}" ]; then
	source ${VIRTUALENVWRAPPER_UBUNTU}
elif [ -e "${VIRTUALENVWRAPPER_GENTOO}" ]; then
	source ${VIRTUALENVWRAPPER_GENTOO}
fi

# Set up ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
	echo "Initializing new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	start_agent;
}
else
	start_agent;
fi

POST_CUSTOM="${WORK_DIR}/custom/post_custom.zsh"
if [ -e "${POST_CUSTOM}" ]; then
    source ${POST_CUSTOM}
fi

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

#===================================================PATH start==========================================================================
# Linuxbrew
export BREW_HOME="$HOME/.linuxbrew"
export MANPATH="$BREW_HOME/share/man"
export INFOPATH="$BREW_HOME/share/info"
export PATH="$PATH:$BREW_HOME/bin"

# Java 
export JAVA_HOME="/usr/local/java"
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib
export PATH="$PATH:$JAVA_HOME/bin"

# Play framework
export PLAY1_HOME="/usr/local/play1"
export PATH="$PATH:$PLAY1_HOME"

# Android
export ANDROID_HOME="/usr/local/android"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

# Golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GO15VENDOREXPERIMENT=1
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# APACHE NGINX PHP MYSQL
export PSYSH_HOME="$HOME/.composer/vendor/psy/psysh"
export APACHE_HOME="/usr/local/apache"
export NGNIX_HOME="/usr/local/nginx"
export PHP_HOME="/usr/local/php"
export MYSQL_HOME="/usr/local/mysql"
export PATH="$PATH:/root/.node/bin:$JAVA_HOME/bin:$APACHE_HOME/bin:$NGNIX_HOME/sbin:$PHP_HOME/bin:$MYSQL_HOME/bin:$PSYSH_HOME/bin"

ENHANCD_FILTER=fzf
export ENHANCD_FILTER

#==================================================PATH end============================================================================
