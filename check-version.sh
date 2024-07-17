#!/bin/bash

# Function to check if running on Pop! OS 22.04 or higher

REQUIRED_VERSION="22.04"
REQUIRED_DISTRO="pop"

check_pop_version() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        gum log --level info "Running on $NAME $VERSION_ID"
        if [ "$ID" = "$REQUIRED_DISTRO" ]; then
            if awk -v current="$VERSION_ID" -v required="$REQUIRED_VERSION" 'BEGIN {exit !(current >= required)}'; then
                return 0
            else
                gum log --level error "$REQUIRED_DISTRO version must be $REQUIRED_VERSION or higher. Current version: $VERSION_ID" >&2
                return 1
            fi
        else
            gum log --level error "This script must be run on Pop! OS. Current OS: $ID" >&2
            return 1
        fi
    else
        gum log --level error "Unable to determine OS. /etc/os-release file not found." >&2
        return 1
    fi
}

if ! check_pop_version; then
    gum log --level error "Script execution failed due to system requirements not being met." >&2
    exit 1
fi
