#!/usr/bin/env bash

# Config for auto-building
git remote rename origin upstream
git config --global user.email "kobolde@midgrad.org"
git config --global user.name "kobolde"
git config --global credential.helper "store --file=$HOME/.git-credentials"
echo "https://${GH_TOKEN}:@github.com" > "$HOME"/.git-credentials

# Build C library
GEN_START_PATH=$PWD
mkdir -p include/mavlink/v2.0
cd include/mavlink/v2.0
git clone https://github.com/Midgrad/libmavlinkcpp_v2.git
cd ../../..
./scripts/update_c_library.sh 2
# v1.0 legacy
#cd "$GEN_START_PATH"
#mkdir -p include/mavlink/v1.0
#cd include/mavlink/v1.0
#git clone https://github.com/mavlink/c_library_v1.git
#cd ../../..
#./scripts/update_c_library.sh 1
