#!/bin/bash

check_gum() {
    # Check if gum is installed
    log_info "Checking gum dependency..."
    if command -v gum &> /dev/null; then
        log_info "gum is already installed."
    else
        log_info "gum is not installed. Installing gum..."
        pacman -S gum
    fi
}

gum() {
    # Gum choose
    export GUM_CHOOSE_CURSOR_FOREGROUND=""
    export GUM_CHOOSE_CURSOR_BACKGROUND=""
    export GUM_CHOOSE_HEADER_FOREGROUND=""
    export GUM_CHOOSE_HEADER_BACKGROUND=""
    export GUM_CHOOSE_ITEM_FOREGROUND=""
    export GUM_CHOOSE_ITEM_BACKGROUND=""
    export GUM_CHOOSE_SELECTED_FOREGROUND=""
    export GUM_CHOOSE_SELECTED_BACKGROUND=""
    export GUM_CHOOSE_HEIGHT=0

    # Gum style
    export BORDER="normal"
    export PADDING="0 5"

    # Gum spin
    export GUM_SPIN_SPINNER="dot"

    command gum "$@"
}

# Run when executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    check_gum
fi

# Please never call a function inside this file
