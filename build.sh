#! /usr/bin/env sh

IF="./Scripts/Build.swift"
OF="./Scripts/Build"

git submodule update --remote --init --recursive --force
xcrun --sdk macosx swiftc -parse-as-library $IF -o $OF
$OF
