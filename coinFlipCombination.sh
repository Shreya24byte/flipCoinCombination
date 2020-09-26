#!/bin/bash -x
echo "Welcome to Flip Coin Combination Problem";

#Variables
heads=0;
tails=0

#Coin toss function
function coinFlip() {
	coin=$((RANDOM%2));
        if [ $coin -eq 0 ];
        then
                heads=$((heads+1));
	else
                tails=$((tails+1));
        fi
}


#Multiple coin toss
for ((toss=0; toss<100; toss++));
do
	coinFlip;
done

#Store singlet combination in the dictionary
declare -A result
result[head]=$heads;
result[tail]=$tails;

echo "Percentage of occurence of heads is $heads %";
echo "Percentage of occurence of tails is $tails %";
