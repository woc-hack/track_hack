#! /bin/bash
while  read -r line
do
    blob=$(echo $line | cut -d\; -f1)
    lang=$(echo $line | cut -d\; -f2)
    loc=$(echo $blob | ~/lookup/showCnt blob | cloc --force-lang=$lang - --csv --quiet --hide-rate | tail -1 | cut -f3- -d, | sed 's/,/;/g')
    err='ERROR'
    if [[ "$loc" == *"Unable"* ]]; then
	    echo "$blob;$err"
    else
	    echo "$blob;$loc"
    fi 
done < "${1:-/dev/stdin}"

