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

function test_print() {
    echo Current terminal: $TERM
    echo $PWD

    echo -e "Normal \e[1mBold\e[0m"
    echo -e "Normal \e[2mDim\e[0m"
    echo -e "Normal \e[4mUnderlined\e[0m"
    echo -e "Normal \e[5mBlink\e[0m"
    echo -e "Normal \e[7minverted\e[0m"
    echo -e "Normal \e[8mHidden\e[0m"
    
    echo -e "Default \e[39mDefault\e[0m"
    echo -e "Default \e[30mBlack\e[0m"
    echo -e "Default \e[31mRed\e[0m"
    echo -e "Default \e[32mGreen\e[0m"
    echo -e "Default \e[33mYellow\e[0m"
    echo -e "Default \e[34mBlue\e[0m"
    echo -e "Default \e[35mMagenta\e[0m"
    echo -e "Default \e[36mCyan\e[0m"
    echo -e "Default \e[37mLight gray\e[0m"
    echo -e "Default \e[90mDark gray\e[0m"
    echo -e "Default \e[91mLight red\e[0m"
    echo -e "Default \e[92mLight green\e[0m"
    echo -e "Default \e[93mLight yellow\e[0m"
    echo -e "Default \e[94mLight blue\e[0m"
    echo -e "Default \e[95mLight magenta\e[0m"
    echo -e "Default \e[96mLight cyan\e[0m"
    echo -e "Default \e[97mWhite\e[0m"
    
    echo -e "Default \e[49mDefault\e[0m"
    echo -e "Default \e[40mBlack\e[0m"
    echo -e "Default \e[41mRed\e[0m"
    echo -e "Default \e[42mGreen\e[0m"
    echo -e "Default \e[43mYellow\e[0m"
    echo -e "Default \e[44mBlue\e[0m"
    echo -e "Default \e[45mMagenta\e[0m"
    echo -e "Default \e[46mCyan\e[0m"
    echo -e "Default \e[47mLight gray\e[0m"
    echo -e "Default \e[100mDark gray\e[0m"
    echo -e "Default \e[101mLight red\e[0m"
    echo -e "Default \e[102mLight green\e[0m"
    echo -e "Default \e[103mLight yellow\e[0m"
    echo -e "Default \e[104mLight blue\e[0m"
    echo -e "Default \e[105mLight magenta\e[0m"
    echo -e "Default \e[106mLight cyan\e[0m"
    echo -e "Default \e[107mWhite\e[0m"
}