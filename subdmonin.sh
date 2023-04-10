#!/bin/bash
if [ $# -eq 0 ]
then
echo "How To use : ./sub.sh <domain>"
echo "Ex : ./sub.sh www.example.com"
else
wget "$1"
less index.html | grep "href=" | cut -d ":" -f 2 | cut -d "/" -f 3 | cut -d ">" -f 1 | cut -d '"' -f 1 | grep -v "$i"| uniq  > url.txt 
echo "======== Is Complit =========="
for sub in  $(cat sub.txt)
do
if [[ $(ping -c 1 $sub 2> /dev/null ) ]]
then
echo " ===== Start Ping ====="
echo "$sub +++++++ Pong" 
echo $sub >> pong.txt
else
echo "$sub ------- Error" >> error.txt
fi
done
for ips in $(cat pong.txt)
do
echo "==== Ip Address ===="

host $ips | cut -d " " -f 4 | uniq >> ips.txt
done
echo "DONE ................"
fi
