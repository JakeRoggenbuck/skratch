#!/bin/sh

# Usage:
# `skratch .py` this will make a Python scratch file
#
# Install:
# `make install`

# Show commands being run
set -x

# Make the directory if needed
mkdir -p ~/Repos/skratch

# Change to the right directory
cd ~/Repos/skratch || exit 1

# Check if it's inside git
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Already inside a Git repository."
else
    echo "Not a Git repository. Initializing..."
	# Make git if it's not inside git
    git init
fi

# Auto commit anything that might be unsaved from last time
git add . && git commit -m "Auto commit from skratch.sh"

# Get extension argument, e.g., ".py"
extension="$1"

# Generate random 6-character alphanumeric string
random_string=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6)

# Combine random string with extension
file="${random_string}${extension}"

# Open the scratch file in editor
$EDITOR "$file"
