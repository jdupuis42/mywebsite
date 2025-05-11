#!/bin/sh
set -e
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
hugo -t hugo-theme-m10c
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
  msg="$*"
fi
git add .
git commit -m "$msg" -a
git push origin main
cd public
git add .
git commit -m "$msg" -a
git push origin main
