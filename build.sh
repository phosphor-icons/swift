#! /usr/bin/env sh

git submodule update --remote --init --recursive --force
xcrun --sdk macosx swiftc -parse-as-library ./Scripts/Build.swift -o ./Scripts/Build
./Scripts/Build
