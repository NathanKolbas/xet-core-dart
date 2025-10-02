#!/bin/sh

# Pub doesn't support sub modules (no recursive checkout) so we have to use git subtree instead.
# This script will update the cargokit subtree
git subtree pull --prefix cargokit git@github.com:irondash/cargokit.git main --squash
