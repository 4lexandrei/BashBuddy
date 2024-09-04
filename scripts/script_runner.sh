#!/bin/bash

CUSTOM_SCRIPTS_DIR="$CUSTOM_SCRIPTS_DIRECTORY"

list_scripts() {
    files=($(find "$CUSTOM_SCRIPTS_DIR" -type l -executable -o -type f -executable))

    clear

    if command -v fzf &> /dev/null; then
        local choice=$(printf '%s\n' "${files[@]}" | fzf --header="Run:" --border)
    elif command -v gum &> /dev/null; then
        local choice=$(printf '%s\n' "${files[@]}"| gum choose --header="Run:")
    fi

    gum style "Run Script Manager"

    echo "$choice"

    if [ -n "$choice" ]; then
        if command -v gum &> /dev/null; then
            echo "Press 'Enter' to continue or 'Ctrl + C' to cancel."
            read
            gum spin --title="Running $choice..." sleep 1
            "$choice"
        else
            echo "Running $choice..." & sleep 1
            "$choice"
        fi
    else
        echo "No script selected." & sleep 1
    fi
}

list_scripts
