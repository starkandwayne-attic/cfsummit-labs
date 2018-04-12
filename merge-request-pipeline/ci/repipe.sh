#!/bin/bash

remote="$(git remote -v | sed -e 's/origin\s*\(.*\) .*/\1/g' | head -n1).git"
prefix=$(echo $USER | cut -d@ -f1)

set -x
fly -t lab set-pipeline -p "${prefix}-merge-request-pipeline" -c ci/pipeline.yml \
    -v git_remote=${remote}
