#!/bin/bash -x

export GOPATH="/Users/evan/GitHub/PeppyHare/go-compiler/01"

commitCode() {
	cd "/Users/evan/GitHub/PeppyHare/go-compiler" || exit
	git add .
	git commit -m "Passing all the tests! Automated commit :)"
}

go test ./lexer
STATUS=$?
if [[ $STATUS == "0" ]]; then
	echo "Passing tests!"
	echo "I am in this directory: $(pwd)"
	commitCode
else
	echo "Not passing tests... :("
fi