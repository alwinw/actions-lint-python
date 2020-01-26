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

echo $PWD
ls

PACKAGES=$2
MAX_LINE_LENGTH=$3

SUPPORTED_PACKAGES="black pycodestyle flake8 pylint isort mypy"
for PACKAGE in $PACKAGES
do
    case $SUPPORTED_PACKAGES in
        *${PACKAGE}*) 
            pretty_print ${PACKAGE} -1
            case $PACKAGE in
                black)
                    echo "Found black!"
                    ;;
                flake8)
                    echo "Found flake8!"
                    ;;
            esac
            ;;
        *)
            echo "$PACKAGE not supported!!"
            pretty_print
            # exit 1
            ;;
    esac
done

PACKAGE=black

case "$2" in *${PACKAGE}*)
    pretty_print ${PACKAGE} -1
    black --version
    black $TEST --check --diff --line-length $MAX_LINE_LENGTH
    BLACK_RESULT=$?
    pretty_print ${PACKAGE} $BLACK_RESULT
    ;;
esac

echo -e "\n"
echo -e "\e[34m------------------------------------------------------------\e[39m"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo -e "\e[34m############################################################\e[39m"
