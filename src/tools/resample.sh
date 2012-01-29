#!/bin/bash

# NOTE: this is a trick to let the generated files end up in the 'small' directory underneath images
#       It would be better to parse the paths properly so we can run resample.py from anywhere

cd src/img
python ../../resample.py