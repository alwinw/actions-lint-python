#!/bin/sh
echo -e "\e[34m############################################################\e[39m"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo "Running $0"
echo -e "\e[34m------------------------------------------------------------\e[39m"

echo "1 is $1"
echo "2 is $2"
echo "3 is $3"
echo "@ is $@"

case "$2" in *black*)
    echo "Black!"
    ;;
esac

echo -e "\e[34m############################################################\e[39m"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo -e "\e[34m------------------------------------------------------------\e[39m"
