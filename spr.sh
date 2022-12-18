 i=1
    for ((naj=1;naj<=dlug;naj++))
    do 
    naj=($naj * $i)
    let i++
    done
    echo "$max"
    if ! [ $dlug -gt 50 ]
    then
    	echo "Zbior przekracza lub jest rowny 50"
    	exit 2
    fi
    if ! [ $ilo -gt 50 ]
    then
    	echo "Zbior  50"
    	exit 2
    fi
