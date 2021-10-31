#!/bin/zsh

pandoc --mathjax $1 ~/projects/active_recall_notes/metadata.yaml -s -o $2
