COUNT=0
function add() {
    for VAL in 1 2 3
    do
        # echo $VAL
        COUNT=$((COUNT + 1))
        echo $COUNT
    done 
    return $COUNT
}

COUNT="$(add)"

echo $COUNT