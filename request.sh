#!/bin/bash

# make n times request at the same time 
# how long each take and the average time

echo Enter the URL : 
read URL

echo "How many request? (enter a number):" 
read REQ_TIME 

#sending request and saving the time

for ((i=0 ;i<$REQ_TIME;i++))
do
	echo "` curl -s -o /dev/null -w %{time_total}  $URL &`" >> times.txt 
done

#average time 

echo time for each request:
cat times.txt

total= paste -sd+ times.txt |bc
echo $total
rm times.txt
