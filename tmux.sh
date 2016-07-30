#!/bin/zsh

SESSION_NAME='dev'
WINDOWS_NAME1='ripple'
WINDOWS_NAME2='run'

source ~/.zshrc
tmux='tmux -2'

tmux start-server

if ! $(tmux has-session -t ${SESSION_NAME}); then
	tmux new-session -d -s ${SESSION_NAME} -n ${WINDOWS_NAME1} # -d is important

	tmux select-window -t ${WINDOWS_NAME1}

	tmux new-window -n ${WINDOWS_NAME2}

    tmux select-window -t ${WINDOWS_NAME2}
    tmux send-keys -t 0 'cd ~/go/src/github.com/bmbstack/ripple && clear' C-m

	tmux select-window -t ${WINDOWS_NAME1}
    tmux send-keys -t 0 'cd ~/go/src/github.com/bmbstack/ripple && vim ' C-m
	tmux select-pane -t 0
fi

tmux attach-session -d -t ${SESSION_NAME}
