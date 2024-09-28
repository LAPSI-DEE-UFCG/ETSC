#!/bin/bash

firefox &

python3 ./sf.py -l 127.0.0.1:5001

tail -f /dev/null
