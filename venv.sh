#!/usr/bin/env bash
# corrosion-panel virtual environment manager

#./venv.sh create      # make new .venv
#./venv.sh activate    # enter venv (same shell)
#./venv.sh deactivate  # exit venv
#./venv.sh remove      # delete it
#./venv.sh reinstall   # rebuild + pip install -e .
#./venv.sh info        # show path / status

VENV_DIR=".venv"

usage() {
    echo "usage: $0 {create|activate|deactivate|remove|reinstall|info}"
}

create_venv() {
    if [ -d "$VENV_DIR" ]; then
        echo "venv already exists at $VENV_DIR"
    else
        echo "creating virtual environment..."
        python3 -m venv "$VENV_DIR"
        echo "venv created."
    fi
}

activate_venv() {
    if [ -d "$VENV_DIR" ]; then
        # shellcheck disable=SC1091
        source "$VENV_DIR/bin/activate"
        echo "venv activated."
    else
        echo "no venv found. run '$0 create' first."
    fi
}

deactivate_venv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        deactivate
        echo "venv deactivated."
    else
        echo "no venv active."
    fi
}

remove_venv() {
    if [ -d "$VENV_DIR" ]; then
        rm -rf "$VENV_DIR"
        echo "venv removed."
    else
        echo "no venv to remove."
    fi
}

reinstall_venv() {
    remove_venv
    create_venv
    echo "reinstalling dependencies..."
    "$VENV_DIR/bin/pip" install -e .
}

info_venv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "active venv: $VIRTUAL_ENV"
    elif [ -d "$VENV_DIR" ]; then
        echo "venv available at: $(realpath "$VENV_DIR")"
    else
        echo "no venv present."
    fi
}

case "$1" in
    create) create_venv ;;
    activate) activate_venv ;;
    deactivate) deactivate_venv ;;
    remove) remove_venv ;;
    reinstall) reinstall_venv ;;
    info) info_venv ;;
    *) usage ;;
esac
