#! /bin/bash

set -e

# Check whether the Einstein Toolkit has been downloaded
if [[ ! -e "$HOME/Cactus/simfactory/bin/sim" ]]; then

    pushd "$HOME" >/dev/null

    # Install and configure the Einstein Toolkit
    echo 'Downloading the Einstein Toolkit...'
    "$HOME/bin/GetComponents" --parallel "$HOME/etc/einsteintoolkit.th"

    cd Cactus

    # TODO: Move these into the Einstein Toolkit
    cp "$HOME/etc/einsteintoolkit.ini" "simfactory/mdb/machines/"
    cp "$HOME/etc/einsteintoolkit.cfg" "simfactory/mdb/optionlists/"
    cp "$HOME/etc/einsteintoolkit.sub" "simfactory/mdb/submitscripts/"
    cp "$HOME/etc/einsteintoolkit.run" "simfactory/mdb/runscripts/"

    # Configure Simfactory
    cp "$HOME/etc/defs.local.ini" "simfactory/etc/"

    popd >/dev/null

fi

exec "$HOME/Cactus/simfactory/bin/sim" "$@"
