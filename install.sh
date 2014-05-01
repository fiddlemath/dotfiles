#!/bin/bash

for f in $(find . -name '.*' ! -path ./ ! -path ../ ! -path '*.git/*' -type f)
do
    cat $f >> ~/$f
done
