package ast

import (
	"monkey/token"
	"testing"
)

func TestString(t *testing.T) {
	program := &Program{
		Statements: []Statement{
			&LetStatement{
				Token: token.Token{Type: token.LET, Literal: "let"},
				Name: &Identifier{
					Token: token.Token{Type: token.IDENT, Literal: "myvar"},
					Value: "myvar",
				},
				Value: &Identifier{
					Token: token.Token{Type: token.IDENT, Literal: "anothervar"},
					Value: "anothervar",
				},
			},
		},
	}

	if program.String() != "let myvar = anothervar;" {
		t.Errorf("program.String() wrong. got=%q", program.String())
	}
}
