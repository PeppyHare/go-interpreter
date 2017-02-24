#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH="$DIR"

formatCode() {
	cd "$DIR" || exit
	gofmt -w .
}

commitCode() {
	cd "$DIR" || exit
	git diff-index --quiet HEAD --
	local no_current_changes=$?
	if [[ $no_current_changes == "0" ]]; then
		echo "No changes to commit!"
	else
		git add .
		git commit -m "Passing all the tests! Automated commit :)"
	fi
}

go test "./src/monkey/lexer"
STATUS=$?
if [[ $STATUS == "0" ]]; then
	echo "Passing tests!"
	echo "I am in this directory: $(pwd)"
	formatCode
	commitCode
else
	echo "Not passing tests... :("
fi
