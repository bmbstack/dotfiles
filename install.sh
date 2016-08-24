#!/bin/zsh

# First, **make sure** all the softwares have been installed.
#	* zsh
#	* tmux
#	* vim
#	* git

HOME=${HOME}
PWD=`pwd`
GIT_USER_NAME=`git config --global user.name`
GIT_USER_EMAIL=`git config --global user.email`
OH_MY_ZSH=${HOME}"/.oh-my-zsh"
ZPLUG_HOME=${HOME}"/.zplug"
FZF_HOME=${HOME}"/.fzf"
QFC_HOME=${HOME}"/.qfc"
VIM_PLUG=${HOME}"/.vim/autoload/plug.vim"
TPM=${HOME}"/.tmux/plugins/tpm"

# Pre check
check_software_exist() {
	softwares=("zsh" "tmux" "vim" "git")
	for sw in "${softwares[@]}"
	do
		# Notice the semicolon
		type ${sw} > /dev/null 2>&1 || 
			{ echo >&2 "ERROR: **${sw}** is not installed!"; exit 1; }
	done
}

create_symlinks() {
	dotfiles=(".zshrc" ".tmux.conf" ".vimrc" ".gitconfig")
	for dotfile in "${dotfiles[@]}"
	do
		ln -sf ${PWD}/${dotfile} ${HOME}/${dotfile}
		echo "Create symlink ${HOME}/${dotfile}"
	done
}

install_oh_my_zsh() {
	if [ -d "${OH_MY_ZSH}"  ]; then
		cd "${OH_MY_ZSH}"
		echo "Change directory to `pwd`"
		echo -e "\033[32mNotice: ${OH_MY_ZSH} exists. Git pull to update...\033[0m"
		git pull
		cd - > /dev/null 2>&1
		echo "Change directory back to `pwd`"
	else
		echo -e "\033[32mNotice: ${OH_MY_ZSH} not exists. Install...\033[0m"
		#git clone git@github.com:robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
		#wget --no-check-certificate http://install.ohmyz.sh -O - | sh
		git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
	fi
}

install_fzf() {
	if [ -d "${FZF_HOME}" ]; then
		cd "${FZF_HOME}"
		echo "Change directory to `pwd`"
		echo -e "\033[32mNotice: ${FZF_HOME} exists. Git pull to update...\033[0m"
		git pull
		cd - > /dev/null 2>&1
		echo "Change directory back to `pwd`"
	else
		echo -e "\033[32mNotice: ${FZF_HOME} not exists. Install...\033[0m"
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
	fi
}

install_qfc() {
	if [ -d "${QFC_HOME}" ]; then
		cd "${QFC_HOME}"
		echo "Change directory to `pwd`"
		echo -e "\033[32mNotice: ${QFC_HOME} exists. Git pull to update...\033[0m"
		git pull
		cd - > /dev/null 2>&1
		echo "Change directory back to `pwd`"
	else
		echo "\033[32mNotice: ${QFC_HOME} not exists. Install...\033[0m"
        git clone https://github.com/pindexis/qfc $HOME/.qfc
	fi
}

install_zlug() {
	if [ -d "${ZPLUG_HOME}"  ]; then
		cd "${ZPLUG_HOME}"
		echo "Change directory to `pwd`"
		echo -e "\033[32mNotice: ${ZPLUG_HOME} exists. Git pull to update...\033[0m"
		git pull
		cd - > /dev/null 2>&1
		echo "Change directory back to `pwd`"
	else
		echo -e "\033[32mNotice: ${ZPLUG_HOME} not exists. Install...\033[0m"
        curl -sL zplug.sh/installer | zsh
	fi
}

install_vim_plug() {
	if [ -f "${VIM_PLUG}" ]; then
		echo -e "\033[32mNotice: ${VIM_PLUG} exists. update...\033[0m"
	else
		echo -e "\033[32mNotice: ${VIM_PLUG} not exists. create...\033[0m"
	fi
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
}

# tmux install 'tpm' and plugins
 install_tpm() {
     if [ -d "${TPM}"  ]; then
         cd "${TPM}"
         echo "Change directory to `pwd`"
         echo -e "\033[32mNotice: ${TPM} existsa. Git pull to update...\033[0m"
         git pull 
         cd - > /dev/null 2>&1
         echo "Change directory back to `pwd`"
     else
         echo -e "\033[32mNotice: ${TPM} not exists. Git clone to create ...\033[0m "
         git clone https://github.com/tmux-plugins/tpm ${TPM}
         tmux source ${HOME}/.tmux.conf
     fi
 }



config_zsh() {
	echo "Create symlink ${HOME}/.zsh"
	ln -sf ${PWD}/.zsh ${HOME}/.zsh
    shellType=`echo $SHELL`
    if [ $shellType = "/bin/zsh" ]; then
        echo "Current shell is zsh"
    else
        echo "Change shell to zsh"        
	    chsh -s `which zsh`
    fi
}

config_tmux() {
	echo "Create symlink ${HOME}/tmux.sh"
	ln -sf ${PWD}/tmux.sh ${HOME}/tmux.sh # TODO, use alise?
}

config_git() {
    if [ ! -n "$GIT_USER_NAME" ] || [ ! -n "$GIT_USER_EMAIL" ]; then
        echo "git config --global user.name or user.email is empty"
	    echo "Config git user.name and user.email..."
        echo "[user]" > .gitconfig
        echo -e "\033[036m Please input your gitconfig user.name: \033[0m"
        read  userName
        echo "user.name=$userName"
        echo "\tname=$userName" >> .gitconfig
        echo -e "\033[036m Please input your gitconfig user.email: \033[0m"
        read  userEmail
        echo "user.email=$userEmail"
        echo "\temail=$userEmail" >> .gitconfig
        echo -e "`cat .tpl_gitconfig`" >> .gitconfig
    else 
        echo -e "git config --global user.name=\033[036m$GIT_USER_NAME\033[0m"
        echo -e "git config --global user.email=\033[036m$GIT_USER_EMAIL\033[0m"
    fi
}

main() {
    check_software_exist
    config_git
    install_oh_my_zsh
    install_fzf
    install_qfc
    install_zlug
    install_vim_plug
    install_tpm
    create_symlinks
    config_zsh
    config_tmux
}

main

echo "Please: source $HOME/.zshrc"
echo "Please: zplug load"
echo "[SETUP OK]"
