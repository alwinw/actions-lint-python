#!/bin/sh
. ./src/utils.sh

header_print

# INPUT ARSG
DIRS=$1
PACKAGES=$2
MAX_LINE_LENGTH=$3

# RUN THROUGH EACH PACKAGE TEST
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
                ;;
                pycodestyle)
                    pycodestyle --version
                    pycodestyle $DIRS --statistics --max-line-length $MAX_LINE_LENGTH
                ;;
                flake8)
                    flake8 --version
                    flake8 $DIRS --max-line-length=$MAX_LINE_LENGTH
                ;;
                pylint)
                    pylint --version
                    pylint $DIRS
                ;;
                isort)
                    isort --version-number
                    isort $DIRS --recursive --check-only --diff
                ;;
                mypy)
                    mypy --version
                    mypy $DIRS --show-column-numbers
            esac
            LOCAL_RESULT=$?
            GLOBAL_RESULT=$((GLOBAL_RESULT + LOCAL_RESULT))
            echo $GLOBAL_RESULT
            pretty_print $PACKAGE $LOCAL_RESULT
        ;;
        *)
            echo "$PACKAGE not supported!!"
            pretty_print
            exit 1
        ;;
    esac
done

if [ $GLOBAL_RESULT -eq 0 ]
then
    footer_print
    exit 0
else
    echo $GLOBAL_RESULT
    # git --no-pager diff
    footer_print
    exit 1
fi