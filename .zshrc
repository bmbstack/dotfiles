# Use the default config, them overwrite it.
. ~/.oh-my-zsh/templates/zshrc.zsh-template

ZSH_THEME="maran"
#ZSH_THEME="muse"
DISABLE_CORRECTION="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git svn python tmux git-flow)

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
export CLASSPATH="$CLASSPATH:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib"
export PATH="$PATH:$JAVA_HOME/bin"

# Android
export ANDROID_HOME="/usr/local/android"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

# Golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GO15VENDOREXPERIMENT=1
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# NodeJS
export NODE="/usr/local/node"
export PATH="$PATH:$NODE/bin"

# APACHE NGINX PHP MYSQL
export PSYSH_HOME="$HOME/.composer/vendor/psy/psysh"
export APACHE_HOME="/usr/local/apache"
export NGNIX_HOME="/usr/local/openresty"
export PHP_HOME="/usr/local/php"
export MYSQL_HOME="/usr/local/mysql"
export PATH="$PATH:/root/.node/bin:$JAVA_HOME/bin:$APACHE_HOME/bin:$NGNIX_HOME/bin:$NGNIX_HOME/nginx/sbin:$PHP_HOME/bin:$MYSQL_HOME/bin:$PSYSH_HOME/bin"

#=================================Proxy==========================================
#export http_proxy="http://127.0.0.1:1087/"
#export https_proxy="http://127.0.0.1:1087/"
#export ftp_proxy="http://127.0.0.1:1087/"
#export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
#export HTTP_PROXY="http://127.0.0.1:1087/"
#export HTTPS_PROXY="http://127.0.0.1:1087/"
#export FTP_PROXY="http://127.0.0.1:1087/"
#export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"

#==============================Proxy使用说明=====================================
# mac下执行下面这一句
#polipo socksParentProxy=127.0.0.1:1080&
#
# ubuntu server上要先使用shadowsocks.json配置文件启动shadowsocks
# sudo sslocal -c shawdowsocks.json -d start
# service polipo start
#==============================Proxy end=====================================
ENHANCD_FILTER=fzf
export ENHANCD_FILTER

#==================================================PATH end============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
