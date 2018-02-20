#!/bin/bash

#
# perltidy rules can be found in .perltidyrc
#

replace=
if [ "$1"  = '--replace' ]; then
    shift
    replace=1
fi

if ! which perltidy > /dev/null 2>&1; then
    echo "No perltidy found, install it first!"
    exit 1
fi

find -name '*.tdy' -delete
find . \( -name '*.p[lm]' -o -name '*.t' \) -print0 | xargs -0 perltidy --pro=/etc/os-autoinst/.perltidyrc

while read file; do
    if ! diff -u ${file%.tdy} $file; then
        if [ -n "$replace" ]; then
            mv -v $file ${file%.tdy}
        else
            echo "RUN tools/tidy script before checkin"
            exit 1
        fi
    else
        rm $file
    fi
done < <(find . -name "*.tdy")

# vim: set sw=4 et: