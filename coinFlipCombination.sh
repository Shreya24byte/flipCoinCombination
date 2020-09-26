#!/bin/bash -x
echo "Welcome to Flip Coin Combination Problem";

#Variables
heads=0;
tails=0
HH=0;
HT=0;
TH=0;
TT=0;
HHH=0; 
HHT=0; 
HTH=0; 
THH=0; 
THT=0; 
TTT=0;

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

#Function for triplet combinations
function triplet() {

	coin1=$((RANDOM%2));
        coin2=$((RANDOM%2));
	coin3=$((RANDOM%2));

	if [[ $coin1 -eq 0 && $coin2 -eq 0 && $coin3 -eq 0 ]];
	then
		HHH=$((HHH+1));
	elif [[ $coin1 -eq 0 && $coin2 -eq 0 && $coin3 -eq 1 ]];
        then
                HHT=$((HHT+1));
	elif [[ $coin1 -eq 0 && $coin2 -eq 1 && $coin3 -eq 0 ]];
        then
                HTH=$((HTH+1));
	elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 0 ]];
        then
                THH=$((THH+1));
	elif [[ $coin1 -eq 1 && $coin2 -eq 0 && $coin3 -eq 1 ]];
        then
                THT=$((THT+1));
	else
		TTT=$((TTT+1));
                triplet+=( TTH );
	fi
}

#Multiple coin toss
for ((toss=0; toss<100; toss++));
do
	singlet;
	doublet;
	triplet;
done

#Store results in the dictionary
declare -A result
result[head]=$heads;
result[tail]=$tails;
result[HH]=$HH;
result[HT]=$HT;
result[TH]=$TH;
result[TT]=$TT;
result[HHH]=$HHH;
result[HHT]=$HHT;
result[HTH]=$HTH;
result[THH]=$THH;
result[THT]=$THT;
result[TTT]=$TTT;


echo "Percentage of occurence of heads is $heads %";
echo "Percentage of occurence of tails is $tails %";

echo "Doublet occurence of HH is $HH %";
echo "Doublet occurence of HT is $HT %";
echo "Doublet occurence of TH is $TH %";
echo "Doublet occurence of TT is $TT %";

echo "Triplet occurence of HHH is $HHH %";
echo "Triplet occurence of HHT is $HHT %";
echo "Triplet occurence of HTH is $HTH %";
echo "Triplet occurence of THH is $THH %";
echo "Triplet occurence of THT is $THT %";
echo "Triplet occurence of TTT is $TTT %";
