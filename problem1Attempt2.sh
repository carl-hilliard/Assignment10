#!/bin/bash


filename="sampleScriptingNumbers.txt"

declare -a a

i=0
while read line
do
	a[i]=$line
	let i+=1
done < $filename

echo "${a[*]}"

sum=0

# declare the function
sumation(){

index=$1
sum=$2

if [ ${#a[*]} -lt 1 ]
then
	return 0
else
	temp1=${a[$index]}
	let sum=sum+temp1
	unset a[index]
	let temp=index+1
	echo "$sum"
	sumation $temp $sum
fi
}

sumation 0 $sum


echo "The total sum: $sum"

#Output to the file
outputFile="problem3.txt"
echo "The recursive sum: " > $outputFile
echo $sum >> $outputFile





## Problem2: Take an input from the user. Using a recursive function, find the Fibonacci series till the 
## number
#read -p "Enter an integer:" input

#declare the variables for the fibonacci sequence
a=0

#declare the function
fib(){
num=$1

## Define the base case
if [ $num -le 2 ]
then
	echo 1

## Define the general case
else 
	let temp1=num-1
	let temp2=num-2
	echo $(( $(fib $temp1) + $(fib $temp2) ))
fi

}

## Get the user to input a number
read -p "Enter a number: " num

## Try using an array to store the series
fibArray=()

for i in $(seq 1 $num)
do
	fibArray[a]+=$(fib $i)
	let a++
done

## Now display the array holding the fibonacci numbers
echo "First $num fibonacci numbers of the series:" ${fibArray[*]} >> $outputFile
echo " "
echo " "





	


