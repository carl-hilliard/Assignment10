## PROBLEM 4

recursiveSort(){

n=$1

## Define the base case
if [ $n -le 1 ]
then 
	return

## Define the general case
else
	let n--
	for i in $(seq 0 $n)
	do 
		## sort the values
		if [ ${unOrderedArray[i]} -gt ${unOrderedArray[n]} ]
		then
			temp=${unOrderedArray[n]}
			unOrderedArray[n]=${unOrderedArray[i]}
			unOrderedArray[i]=$temp
		fi
	done
fi

## Recursively call the function with the smaller n value
recursiveSort $n
}

## Create a random array with 10 values
RANDOM=$$
for i in $(seq 0 9)
do
	unOrderedArray[i]=$(($RANDOM%50))
done

## print the original array and compare it to the sorted array
echo "The unsorted array:"
echo ${unOrderedArray[*]}

## Sort the array and display i9t
recursiveSort "${#unOrderedArray[*]}"

filename="problem4Output.sh"
echo ${unOrderedArray[*]} > $filename


