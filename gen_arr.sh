#!/bin/bash
## complete revision

## marked complete
## get min of two numbers
function get_min(){
	local _var1=$1
	local _var2=$2
	if (( _var1 < _var2 )); then
		echo $_var1
	else
		echo $_var2
	fi
}
## complete here too!
## marked complete
## if greater than 0 then 1 else 0
function get_indicator(){
	local _num=$1
	if (( $_num>0 )); then
		echo 1
	else
		echo 0
	fi
}

## specify the variables outside!
partition_head_arr=()
partition_length_arr=()
function get_partition(){
	_partition_length=$1
	_total_length=$2
	_partition_num=$(expr $(get_indicator $(expr $_total_length % $_partition_length)) + $_total_length / $_partition_length)

	_curr_ind=1
	_curr_tail=0
	echo $_partition_num
	for (( i=1;i<=$_partition_num;i++ )); do
		
		#_curr_ind=$(($_partition_length + $_curr_ind))
		#_curr_tail=$(get_min $_curr_ind $_total_length)
		_curr_length=$(get_min $_partition_length $(($_total_length-$_curr_ind)))
		
		partition_head_arr+=($_curr_ind)
		partition_length_arr+=($_curr_length)
		#zip_arr+=( ($_curr_ind,$_curr_length) )
		_curr_ind=$(($_partition_length + $_curr_ind));
	done
}

## final comment:
## any input
partition_length=2000
total_length=14345
get_partition $partition_length $total_length
#results=$(get_partition $partition_length $total_length) 
#partition_head_arr=$results | cut -f 1 -d ' '
#partition_length_arr=$results | cut -f 2 -d ' '

#echo $partition_head_arr[@]
#for num in ${partition_head_arr[@]}; do echo $num; done
#for num in ${partition_length_arr[@]}; do echo $num; done
echo ${#partition_head_arr[@]}
for (( i=0;i<${#partition_head_arr[@]};i++ )); do 
	result="echo ${partition_head_arr[$i]} ${partition_length_arr[$i]}"
	#echo $result
	var1=`$result | cut -f 1 -d ' '`
	var2=`$result | cut -f 2 -d ' '`
	echo va1 is $var1, var2 is $var2;
done
	

