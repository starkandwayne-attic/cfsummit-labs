#!/bin/bash

export DB_PATH=$PWD"/local_scribble"
cd repo-mr/merge-request-pipeline/

# get dependencies
go get -t -d ./... 

# run tests
go test -v
