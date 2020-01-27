# GitHub Action: Lint Python

## Purpose

This repository is GitHub action to lint python tailored to my personal preferences.

## Features

Tools used

- [black](https://github.com/psf/black) - *Black is the uncompromising Python code formatter. By using it, you agree to cede control over minutiae of hand-formatting.*
- [pycodestyle](https://github.com/PyCQA/pycodestyle) - *pycodestyle is a tool to check your Python code against some of the style conventions in PEP 8.*
- [flake8](https://gitlab.com/pycqa/flake8) - *flake8 is a python tool that glues together pep8, pyflakes, mccabe, and third-party plugins to check the style and quality of some python code.*
- [Pylint](https://github.com/PyCQA/pylint/) - *Pylint is a Python static code analysis tool which looks for programming errors, helps enforcing a coding standard, sniffs for code smells and offers simple refactoring suggestions.*
- [isort](https://github.com/timothycrosley/isort) - *isort is a Python utility / library to sort imports alphabetically, and automatically separated into sections and by type.*
- [mypy](https://github.com/python/mypy) - *Mypy is an optional static type checker for Python. You can add type hints (PEP 484) to your Python programs, and use mypy to type check them statically.*

Options

- Planned options to turn on/off tools used
- Planned options to parse additional arguments such as line length or ignore certain rules
- Options should be mapped to all tools used
- Option to format or to check

## Requirements

- Python 3.7+

## To do

- Consider adding [wemake-python-styleguide](https://github.com/wemake-services/wemake-python-styleguide)

## Brief Version History

### v0.1.0 Initial Release

Summary: Basic functionality achieved

- Usage and selection of black, pycodestyle, flake8, pylint, isort and mypy
- Common max line length variable passed to packages
- Basic test suite of pass and fail python code

## References

- [andymckay/pycodestyle-action](https://github.com/andymckay/pycodestyle-action) - pycodestyle
- [bulv1ne/python-style-check](https://github.com/bulv1ne/python-style-check) - isorty, flake8, black
- [CyberZHG/github-action-python-lint](https://github.com/CyberZHG/github-action-python-lint) - pycodestyle with args
- [fylein/python-pylint-github-action](https://github.com/fylein/python-pylint-github-action) - pylint with args
- [peter-evans/autopep8](https://github.com/peter-evans/autopep8) - autopep8 automatically formats and creates pull request
- [konstruktoid/action-pylint](https://github.com/konstruktoid/action-pylint) - black, flake8 and tools
- [lgeiger/black-action](https://github.com/lgeiger/black-action) - black with args
- [lgeiger/pyflakes-action](https://github.com/lgeiger/pyflakes-action) - pyflakes
- [ricardochaves/python-lint](https://github.com/ricardochaves/python-lint) - black, pylint, isort, pycodestyle, flake8, mypy
- [tayfun/flake8-your-pr](https://github.com/tayfun/flake8-your-pr) - flake8 with annotations
- [wemake-services/wemake-python-styleguide](https://github.com/wemake-services/wemake-python-styleguide) - wemake-python-styleguide
- [WhyNotHugo/python-linting](https://github.com/WhyNotHugo/python-linting) - flake8
- [wrboyce/python-lint-action](https://github.com/wrboyce/python-lint-action) - black, isort
