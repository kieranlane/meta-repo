#!/bin/bash
set -e

# Ensure submodule is updated
git submodule update --init --recursive

# Optional: Pull latest from origin
cd element-web
git pull origin $(git rev-parse --abbrev-ref HEAD)
cd ..

# Clear vendor folder
rm -rf vendor/element-web
mkdir -p vendor/element-web

# Copy contents excluding .git
rsync -a --exclude='.git' element-web/ vendor/element-web/

# Add and commit vendored contents
git add vendor/element-web
git commit -m "Update vendored element-web"
