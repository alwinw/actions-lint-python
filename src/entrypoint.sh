#!/bin/sh
echo -e "\e[34m##################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo "Running $0"
echo -e "--------------------------------------------------\e[39m"

echo "1 is $1"
echo "2 is $2"
echo "3 is $3"
echo "@ is $@"

if [[ $2 == *"black" ]]; then
    echo "Black!"
fi

echo -e "\e[34m##################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"
echo -e "--------------------------------------------------\e[39m"
