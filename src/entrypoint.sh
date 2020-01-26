#!/bin/sh

# Exit script if any command fails
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -eax

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

# Print version of each 
isort --version-number

black --version

flake8 --version


echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"