#!/bin/bash

set -x

mkdir dir-tree

cd dir-tree ;

mkdir a ;

echo "AAA1" > a/a1.txt
echo "AAA2" > a/a2.txt

mkdir b ;

echo "BBB1" > b/b1.txt
echo "BBB2" > b/b2.txt

ln -fs b c

cd ..

tree
