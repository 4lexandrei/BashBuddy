#!/bin/bash

LOG_DIR="$(dirname "$(realpath "$0")")/logs"
LOG_FILE="$LOG_DIR/bashbuddy.log"

mkdir -p "$LOG_DIR"

> "$LOG_FILE"

log_info() {
    local log="$1"
    echo "[INFO] $log" >> "$LOG_FILE"
}

log_error() {
    local log="$1"
    echo "[ERROR] $log" >> "$LOG_FILE"
}
