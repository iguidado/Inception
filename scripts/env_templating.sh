#!/bin/bash

echo $#

if [ $# -lt 1 ]; then
    echo "syntax is \"$0 file_path\""
    exit
fi

if [ ! -f $1 ]; then
    echo "there is no file named $1"
    exit
fi


ADJECTIVES=("happy" "brave" "calm" "eager")
NAMES=("turing" "lovelace" "knuth" "ritchie")

RANDOM_NAME="${ADJECTIVES[$RANDOM % ${#ADJECTIVES[@]}]}_${NAMES[$RANDOM % ${#NAMES[@]}]}"
RANDOM_PASS="$(openssl rand -hex 8)"

cp $1 ./srcs/.env

for i in {1..2}; do
    RANDOM_NAME="${ADJECTIVES[$RANDOM % ${#ADJECTIVES[@]}]}_${NAMES[$RANDOM % ${#NAMES[@]}]}"
    RANDOM_PASS="$(openssl rand -hex 8)"


    sed "s/CHANGE_PASS_$i/${RANDOM_PASS}/" -i ./srcs/.env
    sed "s/CHANGE_NAME_$i/${RANDOM_NAME}/" -i ./srcs/.env
done