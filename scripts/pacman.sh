#!/bin/bash

gum style "Pacman"

pacman_update() {
    echo "Updating system with pacman..."
    sudo pacman -Syu
}

pacman_search() {
    echo "Searching packages..."
    pacman -Q | fzf
}

list_pacman_actions() {
    local options=(
        "Update"
        "Search packages"
    )

    local choice=$(gum choose --header="Select option:" "${options[@]}")
    case "$choice" in
        *"Update"*)
            pacman_update ;;
        *"Search packages"*)
            pacman_search
    esac
}

list_pacman_actions
