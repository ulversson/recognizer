#!/bin/bash

find $1 -name "*.jpg" -exec mogrify -format png {} \;
find $1 -name "*.jpg" -exec rm {} \;