#!/bin/bash

function impl() {
  printf "## QuaX v%s\n\n" "$1"
  echo "What's new in QuaX v$1:"

  git log "$(git describe --tags --abbrev=0)"..HEAD --reverse --pretty=format:"%H%n%aN%n%s" | while IFS= read -r sha && IFS= read -r name && IFS= read -r subject; do
    author=$(python get_commit_author.py "$sha" "$name")
    echo "  - $subject $author<sup>[[view modified code]](https://github.com/teskann/quax/commit/$sha)</sup>"
  done
}

impl "$1" > changelog.md