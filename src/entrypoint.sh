#!/bin/sh
. ./src/utils.sh

header_print

git --version

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
    echo -e "\n"
    echo -e "GLOBAL EXIT CODE IS $GLOBAL_RESULT"
    
    for PACKAGE in $PACKAGES
    do
        case $PACKAGE in
            isort)
                echo "\n\e[36mFormatting with isort...\e[0m"
                isort $DIRS
            ;;
            flake8)
                echo "\n\e[36mFormatting with autopep8...\e[0m"
                autopep8 $DIRS
            ;;
            black)
                echo -e "\n\e[36mFormatting with black...\e[0m"
                black $DIRS
            ;;
        esac
    done
    echo -e "\n\e[36Git diff is...\e[0m"
    git --no-pager diff
    footer_print
    exit 1
fi