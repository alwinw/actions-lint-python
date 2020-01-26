#!/bin/sh

function pretty_print() {
    if [[ $2 -eq -1 ]]
    then
        echo -e "\n"
        local MESSAGE="Running $1 Test"
        local COLOUR=4
        elif [[ $2 -eq 0 ]]; then
        local MESSAGE="$1 Test Passed!"
        local COLOUR=2
        elif [[ $2 -eq 1 ]]; then
        local MESSAGE="$1 Test Failed!"
        local COLOUR=1
    else
        echo -e "\n"
        local MESSAGE="$1"
        local COLOUR=4
    fi
    echo -e "\e[7m\e[3${COLOUR}m##########       ${MESSAGE}       ##########\e[0m"
}

function header_print() {
    echo -e "\e[32m############################################################\e[0m"
    echo -e "   Starting ${GITHUB_WORKFLOW}"
    echo -e "   From ${GITHUB_ACTION}"
    echo -e "   Running $0"
    echo -e "\e[32m------------------------------------------------------------\e[0m"
}

function footer_print() {
    echo -e "\n"
    echo -e "\e[32m------------------------------------------------------------\e[0m"
    echo -e "   Completed ${GITHUB_WORKFLOW}"
    echo -e "   From ${GITHUB_ACTION}"
    echo -e "\e[32m############################################################\e[0m"
    
}