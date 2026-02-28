#!/bin/bash

# Configuration
BUILD_DIR="build"
TOOLCHAIN="$HOME/.local/share/vcpkg/scripts/buildsystems/vcpkg.cmake"
GENERATOR="Ninja"

do_configure() {
    echo "Configuring..."
    cmake -B "$BUILD_DIR" -S . -G "$GENERATOR" -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN"
}

do_build() {
    echo "Building..."
    if [ ! -d "$BUILD_DIR" ]; then
        echo "Build directory not found. Configuring first..."
        do_configure
    fi
    cmake --build "$BUILD_DIR"
}

do_clean() {
    echo "Cleaning $BUILD_DIR..."
    rm -rf "$BUILD_DIR"
}

do_run() {
    echo "Running..."
    ./build/appStickDrift
}

case "$1" in
    configure)
        do_configure
        ;;
    build)
        do_build
        ;;
    clean)
        do_clean
        ;;
    run)
        do_run
        ;;
    buildRun)
        do_build
        do_run
        ;;
    *)
        echo "Usage: $0 {configure|build|clean|run|buildRun}"
        exit 1
        ;;
esac

