#!/bin/bash

ci_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
remote="$(git remote -v | sed -e 's/origin\s*\(.*\) .*/\1/g' | head -n1)"
prefix=$(echo $USER | cut -d@ -f1)
pipeline="${prefix}-merge-request-pipeline"

set -x
fly -t lab set-pipeline -p "${pipeline}" -c ${ci_dir}/pipeline.yml \
    -v git_remote=${remote}

fly -t lab unpause-pipeline -p "${pipeline}"
