#!/bin/sh

# Pub doesn't support sub modules (no recursive checkout) so we have to use git subtree instead.
# This script will update the xet-core subtree
git subtree pull --prefix xet-core git@github.com:huggingface/xet-core.git main --squash
