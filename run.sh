#!/bin/bash
echo remove last project
rm -rf ./build/*
echo start building...
cmake -S . -B ./build
cd build
make
cd ..
echo build new project inside build directory
