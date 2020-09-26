#!/bin/bash -x
echo "Welcome to Flip Coin Combination Problem";

#Variables
heads=0;
tails=0
HH=0;
HT=0;
TH=0;
TT=0;

#Function for singlet combination
function singlet() {
	coin=$((RANDOM%2));
        if [ $coin -eq 0 ];
        then
                heads=$((heads+1));
	else
                tails=$((tails+1));
        fi
}

#Function for doublet combinations
function doublet() {
	coin1=$((RANDOM%2));
	coin2=$((RANDOM%2));
	if [[ $coin1 -eq 0 && $coin2 -eq 0 ]];
	then
		HH=$((HH+1));
	elif [[ $coin1 -eq 0 && $coin2 -eq 1 ]];
	then
		HT=$((HT+1));
	elif [[ $coin1 -eq 1 && $coin2 -eq 0 ]];
	then
		TH=$((TH+1));
	else
		TT=$((TT+1));
	fi
}

#Multiple coin toss
for ((toss=0; toss<100; toss++));
do
	singlet;
	doublet;
done

#Store results in the dictionary
declare -A result
result[head]=$heads;
result[tail]=$tails;
result[HH]=$HH;
result[HT]=$HT;
result[TH]=$TH;
result[TT]=$TT;


echo "Percentage of occurence of heads is $heads %";
echo "Percentage of occurence of tails is $tails %";

echo "Doublet occurence of HH is $HH %";
echo "Doublet occurence of HT is $HT %";
echo "Doublet occurence of TH is $TH %";
echo "Doublet occurence of TT is $TT %";
