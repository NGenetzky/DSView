#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
APPNAME='DSView'

has_libraries(){
    [[ -f /usr/local/lib/libsigrok4DSL.a ]] || return 1
    [[ -f /usr/local/lib/libsigrokdecode4DSL.a ]] || return 1
}

is_installed(){
    command -v DSView > /dev/null
}

install(){
    pushd "${SCRIPTDIR}/../${APPNAME}" > /dev/null

    cmake .
    make
    sudo make install

    popd > /dev/null
}

main(){
    if ! has_libraries; then
        echo 'Install libraries first.'
        exit 1
    fi
    if is_installed; then
        echo 'Already installed'
        exit 0
    fi

    install
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi


