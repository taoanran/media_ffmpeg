#!/bin/bash
pushd SDL-1.2.15
./configure; make;sudo make install
popd

pushd ffmpeg-0.8.7 
./configure; make;sudo make install
popd

echo "build end !!!!!!!!!!!!!!"
