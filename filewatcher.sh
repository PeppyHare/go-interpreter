#!/bin/sh -x
# This is just a wrapper for the filewatcher gem
#  (https://github.com/thomasfl/filewatcher)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# filewatcher -l -d 1 -s '**/*.go **/*.sh README.md' "sh $DIR/runtests.sh"
ag -l | entr -d bash "$DIR/runtests.sh"
