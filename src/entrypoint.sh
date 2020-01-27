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
            LOCAL_RESULT=$(( LOCAL_RESULT < 1 ? LOCAL_RESULT : 1 ))
            GLOBAL_RESULT=$((GLOBAL_RESULT + LOCAL_RESULT))
            pretty_print $PACKAGE $LOCAL_RESULT
        ;;
        *)
            echo -e "\n\n\e[31m\e[1m\"$PACKAGE\" is not supported!!\e[0m"
            echo "Supported packages are: $SUPPORTED_PACKAGES"
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
    pretty_print "GLOBAL EXIT CODE IS $GLOBAL_RESULT" 2
    echo -e "\e[36mLet's try fix some of these errors...\e[0m\n"
    
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
    pretty_print "After auto formatting" 2
    echo -e "\e[36mGit diff is...\e[0m\n"
    git --no-pager diff --color=always
    git reset --hard HEAD 
    footer_print
    exit 1
fi