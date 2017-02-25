#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH="$DIR"

formatCode() {
	cd "$DIR" || exit
	gofmt -w .
}

commitCode() {
	cd "$DIR" || exit
	git status
	git add .
	git commit -m "Passing all the tests! Automated commit :)"
	return 0 # just in case nothing to commit
}

echo ""
echo "$(date) :  Testing out new changes now :)"

go test -v "./..." | gsed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
STATUS=$?
if [[ $STATUS == "0" ]]; then
	echo "Passing tests!"
	echo "I am in this directory: $(pwd)"
	formatCode
	commitCode
else
	echo "Not passing tests... :("
fi
