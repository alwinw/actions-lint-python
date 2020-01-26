#!/bin/sh

TEST=test/sample_bad.py

function pretty_print() {
    if [ $2 -eq -1 ]; then
        local MESSAGE="Running ${1} Test"
        local COLOUR=4
    elif [ $2 -eq 0 ]; then
        local MESSAGE="${1} Test Passed!"
        local COLOUR=2
    elif [ $2 -eq 1 ]; then 
        local MESSAGE="${1} Test Failed!" 
        local COLOUR=1
    fi
    echo -e "\e[3${COLOUR}m##########\e[39m     \e[4${COLOUR}m ${MESSAGE} \e[49m      \e[3${COLOUR}m##########\e[39m"
}



function black_test() {
    pretty_print $1 -1
    # Try
    (
        set -e
        black --version
        black --check ${TEST}
    )
    # Catch
    BLACK_RESULT=$?
    if [ $BLACK_RESULT -ne 0 ]; then
        black --diff ${TEST}
    fi
    pretty_print $1 $BLACK_RESULT
}


black_test "Black"

