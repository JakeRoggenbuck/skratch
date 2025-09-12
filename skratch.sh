#!/bin/sh

# Usage:
# `sk .py` this will make a Python "skratch" file
#
# `sk commit` simply commit the current stuff
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

# If you just want to commit, exit here after auto commit
if [[ $extension -eq "commit" ]]; then
	exit
fi

# Generate random 6-character alphanumeric string
random_string=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 6)

# Combine random string with extension
file="${random_string}${extension}"

# Open the "skratch" file in editor
$EDITOR "$file"
