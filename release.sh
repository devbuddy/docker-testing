#!/usr/bin/env bash
set -eo pipefail

if [[ -z "$1" ]]; then
    echo "Usage: $0 [image-tag]"
    echo "Example: $0 v1.12.4-0"
    exit 1
fi

git tag $1
git push --tags
