#!/bin/sh
echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

echo "# is $#"
echo "0 is $0"
echo "1 is $1"
echo "2 is $2"
echo "3 is $3"
echo "@ is $@"

if [[ $3 == *"black" ]]; then
    echo "Black!"
fi

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"