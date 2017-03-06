#!/bin/bash -x
# 
# The object of this is to
#  - quickly run all go tests
#  - gofmt the code
#  - create a new git commit if all of the tests are passing
# 
# In general, while working on the project, I will use https://github.com/cespare/reflex to run the tests passively while I make changes. From this working directory, I can run:
# 
# $ reflex bash runtests.sh
# 
# This will watch for any file modifications in the project, and re-run the tests (and possibly commit the code) when they occur (wow such TDD)
# 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH="$DIR"

formatCode() {
	cd "$DIR" || exit
	printf "\033[32mApplying gofmt...\033[0m\n"
	gofmt -w .
}

commitCode() {
	cd "$DIR" || exit
	git add .
	git status
	git commit && git push
    printf "\033[32mEverything's looking good :)\033[0m\n\n"
}

echo ""
echo "$(date) :  Testing out new changes now :)"

formatCode
go test -cover "./..."
STATUS=$?
if [[ $STATUS == "0" ]]; then
    printf "\033[32mPassing tests!\033[0m\n"
    echo "I am in this directory: $(pwd)"
    commitCode
else
    printf "\033[31mNot passing tests... :(\033[0m\n"
fi
