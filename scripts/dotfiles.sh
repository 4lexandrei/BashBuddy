#!/bin/bash

DOTFILES_DIR="$DOTFILES_DIRECTORY"

run_script() {
  scripts=($(find "$DOTFILES_DIR" -type f -name "*.sh" -executable))

  clear

  local choice=$(printf '%s\n' "${scripts[@]}" | fzf --header="Run:" --border)

  gum style "Dotfiles"

  echo "$choice"

  if [ -n "$choice" ]; then
    if command -v gum &>/dev/null; then
      echo "Press 'Enter' to continue or 'Ctrl + C' to cancel."
      read
      gum spin --title="Running $choice..." sleep 1
      "$choice"
    else
      echo "Running $choice..." &
      sleep 1
      "$choice"
    fi
  else
    echo "No script selected." &
    sleep 1
  fi
}

run_script
