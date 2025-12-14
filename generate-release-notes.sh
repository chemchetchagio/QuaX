#!/bin/bash

function impl() {
  printf "## QuaX v%s\n\n" "$1"
  echo "What's new in QuaX v$1:"

  git log "$(git describe --tags --abbrev=0)"..HEAD --reverse --pretty=format:"  - %s (by @%aN) <sup>[[view modified code]](https://github.com/teskann/quax/commit/%H)</sup>"
}

impl "$1" > changelog.md