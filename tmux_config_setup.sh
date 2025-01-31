#!/bin/bash
SESH="tmux_config"
DIR_PATH="~/.config/tmux"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
    # No existing session
    tmux new-session -d -s $SESH -n "nvim"

    tmux send-keys -t $SESH:nvim "cd ${DIR_PATH}" C-m
    tmux send-keys -t $SESH:nvim "nvim" C-m
    
    tmux new-window -t $SESH -n "lazygit"
    tmux send-keys -t $SESH:lazygit "cd ${DIR_PATH}" C-m
    tmux send-keys -t $SESH:lazygit "lazygit" C-m

    tmux select-window -t "nvim"
fi

tmux attach-session -t $SESH
