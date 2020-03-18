#!/bin/bash

# target py37 because Apple ships Py 3.7 with Xcode CLI tools
(
    pyenv shell 3.8.0
    black -v -t py37 prepare_iso
)
