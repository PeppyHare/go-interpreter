/*
Abstract Syntax Tree for the Monkey language interpreter
*/
package ast

type Node interface {
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
