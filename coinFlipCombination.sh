#!/bin/bash -x
echo "Welcome to Flip Coin Combination Problem";

#Coin toss
toss=$((RANDOM%2));

if [ $toss -eq 0 ];
then
	echo "Heads";
else
	echo "Tails";
fi
