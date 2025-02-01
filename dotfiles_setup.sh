#!/bin/bash
SESH="dotfiles"
tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
    source ~/.config/dotfiles/basic_session_setup.sh $SESH
fi

tmux attach-session -t $SESH
