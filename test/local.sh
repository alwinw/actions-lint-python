#!/bin/sh

TEST=test/sample_good.py

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
    # Info
    pretty_print $1 -1
    black --version
    # Try
    (
        set -e
        black $TEST --check --line-length $MAX_LINE_LENGTH
    )
    # Catch
    BLACK_RESULT=$?
    if [[ $BLACK_RESULT -ne 0 ]]; then
        black $TEST --diff --line-length $MAX_LINE_LENGTH
    fi
    pretty_print $1 $BLACK_RESULT
}

function pycodestyle_test() {
    # Info
    pretty_print $1 -1
    pycodestyle --version
    # Try
    (
        set -e
        pycodestyle $TEST
    )
    # Catch
    PCS_RESULT=$?
    if [[ $PCS_RESULT -ne 0 ]]; then
        pycodestyle $TEST --statistics
    fi
    pretty_print $1 $PCS_RESULT
}

function flake8_test() {
    # Info
    pretty_print $1 -1
    flake8 --version
    # Try
    (
        set -e
        flake8 $TEST --max-line-length=$MAX_LINE_LENGTH
    )
    # Catch
    FLAKE_RESULT=$?
    if [[ $FLAKE_RESULT -ne 0 ]]; then
        flake8 $TEST
    fi
    pretty_print $1 $FLAKE_RESULT
}

black_test "Black"
pycodestyle_test "PyCodeStyle"
flake8_test "Flake8"
