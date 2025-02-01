#!/bin/bash
# Creates a basic tmux session taking in an argument as the session name
# Sets up a neovim window and a lazygit window
# Must be called from within project directory
# Onus is on the caller to ensure a session does not already exist
SESH=$1
# No existing session
tmux new-session -d -s $SESH -n "nvim"

tmux send-keys -t $SESH:nvim "nvim" C-m

tmux new-window -t $SESH -n "lazygit"
tmux send-keys -t $SESH:lazygit "lazygit" C-m

tmux select-window -t "nvim"
