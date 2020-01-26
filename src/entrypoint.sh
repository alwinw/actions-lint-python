#!/bin/sh

. ./src/utils.sh

echo -e "\e[34m############################################################\e[39m"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo "Running $0"
echo -e "\e[34m------------------------------------------------------------\e[39m"


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
                    black --version
                    ;;
                flake8)
                    flake8 --version
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

echo -e "\n"
echo -e "\e[34m------------------------------------------------------------\e[39m"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo -e "\e[34m############################################################\e[39m"
