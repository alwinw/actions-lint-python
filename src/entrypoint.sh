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

echo -e "\e[34m############################################################\e[39m"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo "Running $0"
echo -e "\e[34m------------------------------------------------------------\e[39m"

echo "1 is $1"
echo "2 is $2"
echo "3 is $3"
echo "@ is $@"

MAX_LINE_LENGTH=$3
PACKAGE=black

case "$2" in *${PACKAGE}*)
    pretty_print "Black" -1
    black --version
    black $TEST --check --diff --line-length $MAX_LINE_LENGTH
    BLACK_RESULT=$?
    pretty_print $1 $BLACK_RESULT
    ;;
esac

echo -e "\e[34m############################################################\e[39m"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo -e "\e[34m------------------------------------------------------------\e[39m"
