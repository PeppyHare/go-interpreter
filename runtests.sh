#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH="$DIR"

formatCode() {
	cd "$DIR" || exit
	gofmt -w .
}

commitCode() {
	cd "$DIR" || exit
	git add .
	git commit -m "Passing all the tests! Automated commit :)"
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
