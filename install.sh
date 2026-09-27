#!/bin/bash

set -exuo pipefail

QE_DIR="$HOME/qe"

mkdir -p "$QE_DIR"
cd "$QE_DIR"

echo "start cloning qe source code form github"

git clone --depth 1 https://github.com/QEF/q-e.git .

echo "clone success!"

echo "start compiling"

ml gcc/11.2.0

./configure 
make all -j 

echo "finish"

echo "run test"
cd $QE_DIR/test-suite
make run-tests-pw