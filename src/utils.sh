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
    echo -e "\e[3${COLOUR}m##########\e[39m     \e[4${COLOUR}m ${MESSAGE} \e[49m      \e[3${COLOUR}m##########\e[39m"
}

function header_print() {
    echo -e "\e[34m############################################################\e[39m"
    echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
    echo "Running $0"
    echo -e "\e[34m------------------------------------------------------------\e[39m"
}

function footer_print() {
    echo -e "\n"
    echo -e "\e[34m------------------------------------------------------------\e[39m"
    echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
    echo -e "\e[34m############################################################\e[39m"
    
}