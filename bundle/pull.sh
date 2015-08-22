#!/bin/zsh
for file in */
    git -C $file pull
