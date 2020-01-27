#!/bin/sh

TEST=test

MAX_LINE_LENGTH=120
IGNORE_E=""

function pretty_print() {
    if [[ $2 -eq -1 ]]; then
        echo -e "\n"
        local MESSAGE="Running ${1} Test"
        local COLOUR=4
        elif [[ $2 -eq 0 ]]; then
        local MESSAGE="${1} Test Passed!"
        local COLOUR=2
        elif [[ $2 -eq 1 ]]; then
        local MESSAGE="${1} Test Failed!"
        local COLOUR=1
    fi
    echo -e "\e[3${COLOUR}m##########\e[39m     \e[4${COLOUR}m ${MESSAGE} \e[49m      \e[3${COLOUR}m##########\e[39m"
}

function black_test() {
    pretty_print $1 -1
    black --version
    black $TEST --check --diff --line-length $MAX_LINE_LENGTH
    BLACK_RESULT=$?
    pretty_print $1 $BLACK_RESULT
}

function pycodestyle_test() {
    pretty_print $1 -1
    pycodestyle --version
    pycodestyle $TEST  --statistics --max-line-length $MAX_LINE_LENGTH
    PCS_RESULT=$?
    pretty_print $1 $PCS_RESULT
}

function flake8_test() {
    pretty_print $1 -1
    flake8 --version
    flake8 $TEST --max-line-length=$MAX_LINE_LENGTH
    FLAKE_RESULT=$?
    pretty_print $1 $FLAKE_RESULT
}

function pylint_test() {
    pretty_print $1 -1
    pylint --version
    pylint $TEST
    PYLINT_RESULT=$?
    print $PYLINT_RESULT
    pretty_print $1 $PYLINT_RESULT
}

function isort_test() {
    pretty_print $1 -1
    isort --version-number
    isort $TEST --recursive --check-only --diff
    ISORT_RESULT=$?
    pretty_print $1 $ISORT_RESULT
}

function mypy_test() {
    pretty_print $1 -1
    mypy --version
    mypy $TEST --show-column-numbers
    MYPY_RESULT=$?
    pretty_print $1 $MYPY_RESULT
}

black_test "Black"
pycodestyle_test "PyCodeStyle"
flake8_test "Flake8"
pylint_test "Pylint"
isort_test "Isort"
mypy_test "Mypy"
