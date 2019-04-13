#!/bin/bash

# SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

main(){
    sudo apt-get install \
        git-core build-essential cmake autoconf automake libtool pkg-config \
        libglib2.0-dev libzip-dev libudev-dev libusb-1.0-0-dev  python3-dev \
        qt5-default libboost-dev libboost-test-dev libboost-thread-dev \
        libboost-system-dev libboost-filesystem-dev check libfftw3-dev
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi

