#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
LIBNAME='libsigrokdecode4DSL'

is_installed(){
    [[ -f /usr/local/lib/${LIBNAME}.a ]]
}

make_and_install(){
    pushd "${SCRIPTDIR}/../${LIBNAME}" > /dev/null

    ./autogen.sh
    ./configure
    make
    sudo make install

    popd > /dev/null
}

main(){
    if is_installed; then
        echo 'Already installed'
        exit 0
    fi

    make_and_install
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi


