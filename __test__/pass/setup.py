#!/usr/bin/env python

"""The setup script."""

# https://mypy.readthedocs.io/en/latest/running_mypy.html#missing-imports
# setuptools is missing even though it was merged in the past
#   https://github.com/python/typeshed/
#   commit/c40da79e8fbb6dfb94d56210d5b35cf3cdf9d352?diff=unified

from setuptools import find_packages, setup  # type: ignore

with open("README.rst") as readme_file:
    readme = readme_file.read()  # pylint: disable=locally-disabled, invalid-name

with open("HISTORY.rst") as history_file:
    history = history_file.read()  # pylint: disable=locally-disabled, invalid-name

requirements = ["argparse"]  # pylint: disable=locally-disabled, invalid-name

setup_requirements = [
    "pytest-runner"]  # pylint: disable=locally-disabled, invalid-name

test_requirements = [
    "pytest>=3"]  # pylint: disable=locally-disabled, invalid-name

setup(
    author="Alwin Wang",
    author_email="16846521+AlwinW@users.noreply.github.com",
    python_requires=">=3.5",
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Natural Language :: English",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
    ],
    description="Example",
    entry_points={"console_scripts": ["example=example.cli:main"]},
    install_requires=requirements,
    license="MIT license",
    long_description=readme + "\n\n" + history,
    include_package_data=True,
    keywords="example",
    name="example",
    packages=find_packages(include=["example", "example.*"]),
    setup_requires=setup_requirements,
    test_suite="tests",
    tests_require=test_requirements,
    url="",
    version="0.0.1",
    zip_safe=False,
)
