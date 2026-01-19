#!/usr/bin/env bash
set -euo pipefail

PUSH_REMOTE="${PUSH_REMOTE:-vandome}"
PULL_REMOTE="${PULL_REMOTE:-origin}"
BRANCH="${BRANCH:-main}"

git config --global remote.pushDefault "$PUSH_REMOTE"
git branch --set-upstream-to="$PULL_REMOTE/$BRANCH" "$BRANCH"
git fetch "$PULL_REMOTE"
git checkout "$BRANCH"
git merge "$PULL_REMOTE/$BRANCH"
git push "$PUSH_REMOTE" "$BRANCH"
