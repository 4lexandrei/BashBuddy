#!/bin/bash

BASHBUDDY_PATH="$(dirname "$(realpath "$0")")"

source "$BASHBUDDY_PATH/config/bashbuddy.conf"
source "$BASHBUDDY_PATH/lib/logger.sh"
source "$BASHBUDDY_PATH/lib/gum.sh"

SCRIPTS_DIR="$BASHBUDDY_PATH/scripts"

set_permissions() {
    for script in "$SCRIPTS_DIR"/*; do
        if [ -f $script ]; then
            if [ ! -x $script ]; then
                script_name=$(basename "$script")
                gum spin --title="Making $script_name executable..." sleep 1
                log_info "Making $script_name executable..."
                chmod +x "$script"
            fi
        fi
    done
}

show_menu() {
    clear
    local options=(
        "Run Script Manager"
        "Pacman Utility"
        "Exit"
    )

    gum style "Welcome to BashBuddy!"

    local choice=$(gum choose --header="Please select an option:" "${options[@]}")

    clear

    case $choice in
        *"Run Script Manager"*)
            bash "$SCRIPTS_DIR/script_runner.sh" ;;
        *"Pacman Utility"*)
            bash "$SCRIPTS_DIR/pacman.sh" ;;
        *"Exit"*)
            exit 0 & clear ;;
    esac
    clear
}


set_permissions
check_gum
show_menu
