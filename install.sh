#!/bin/bash

for f in .*
do
    cat $f >> ~/$f
done
