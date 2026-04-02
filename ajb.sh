#!/bin/bash

# Configuration
BUILD_DIR="build"
TOOLCHAIN="$HOME/.local/share/vcpkg/scripts/buildsystems/vcpkg.cmake"
GENERATOR="Ninja"

do_configure() {
    echo "Configuring..."
    cmake -B "$BUILD_DIR" -S . -G "$GENERATOR" \
    -DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN" \
    -DVCPKG_SET_CHARSET_FLAG=ON \
    -DVCPKG_INSTALL_OPTIONS="--clean-after-build;--clean-buildtrees-after-build;--clean-packages-after-build"
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

do_clean_vcpkg() {
    echo "Cleaning vcpkg internal caches..."
    # Warning: This will force vcpkg to re-download/re-build next time if cache is gone
    # vcpkg contactable-empty-dir # Standard vcpkg way to find paths, but usually:
    rm -rf "$HOME/.local/share/vcpkg/buildtrees/*"
    rm -rf "$HOME/.local/share/vcpkg/packages/*"
    rm -rf "$HOME/.local/share/vcpkg/downloads/*"
    echo "Done!"
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
    "clean-vcpkg")
        do_clean_vcpkg
        ;;
    run)
        do_run
        ;;
    buildRun)
        do_build
        do_run
        ;;
    *)
        echo "Usage: $0 {configure|build|clean|clean-vcpkg|run|buildRun}"
        exit 1
        ;;
esac

