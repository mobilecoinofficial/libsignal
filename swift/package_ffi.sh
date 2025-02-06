#!/bin/bash

set -euo pipefail

SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR

targets=("x86_64-apple-ios" "aarch64-apple-ios" "aarch64-apple-ios-sim")

rm -rf .build
for target in "${targets[@]}"; do
    mkdir -p ".build/target/$target/release"
    cp "../target/$target/release/libsignal_ffi.a" ".build/target/$target/release"
done

tar -czvf "libsignal-client-ios-build-v0.64.1.tar.gz" -C .build target
