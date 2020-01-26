#!/bin/sh

. ./src/utils.sh

header_print

DIRS=$1
PACKAGES=$2
MAX_LINE_LENGTH=$3

SUPPORTED_PACKAGES="black pycodestyle flake8 pylint isort mypy"
GLOBAL_RESULT=0
LOCAL_RESULT=0
for PACKAGE in $PACKAGES
do
    case $SUPPORTED_PACKAGES in
        *${PACKAGE}*) 
            pretty_print $PACKAGE -1
            case $PACKAGE in
                black)
                    black --version
                    black $DIRS --check --diff --line-length $MAX_LINE_LENGTH
                    LOCAL_RESULT=$?
                    ;;
                flake8)
                    flake8 --version
                    ;;
            esac
            GLOBAL_RESULT=$((GLOBAL_RESULT + LOCAL_RESULT))
            pretty_print $PACKAGE $LOCAL_RESULT
            ;;
        *)
            echo "$PACKAGE not supported!!"
            pretty_print
            # exit 1
            ;;
    esac
done

echo $GLOBAL_RESULT

footer_print