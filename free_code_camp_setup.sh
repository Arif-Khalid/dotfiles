#!/bin/bash
SESH="free_code_camp"
tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
    source ~/.config/dotfiles/basic_session_setup.sh $SESH
    tmux new-window -t $SESH -n "mongodb"
    tmux send-keys -t $SESH:mongodb "source $HOME/.config/dotfiles/docker/mongodb_setup.sh" C-m
    tmux select-window -t "nvim"
fi

tmux attach-session -t $SESH
