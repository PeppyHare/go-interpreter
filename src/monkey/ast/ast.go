package ast

`Abstract Syntax Tree for the Monkey language interpreter`

type Node internface {
	TokenLiteral(string)
}

type Statement interface {
	Node
	statementNode()
}

type Expression interface {
	Node
	expressionNode()
}