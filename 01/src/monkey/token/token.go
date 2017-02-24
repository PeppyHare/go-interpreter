package token

type TokenType string

type Token struct {
	Type	TokenType
	Literal	string
}

var keywords = map[string]TokenType{
	"fn":	FUNCTION,
	"let":	LET,
	"return": RETURN, 
	"if": IF,
	"else": ELSE,
	"true": TRUE, 
	"false": FALSE,
}

func LookupIdent(ident string) TokenType {
    if tok, ok := keywords[ident]; ok {
        return tok
    }
    return IDENT
}

const (
	ILLEGAL	= "ILLEGAL"
	EOF		= "EOF"

	// Identifiers + literals
	IDENT	= "IDENT" // add, foobar, x, y
	INT		= "INT" // 1343456, 2

	// Operators
	ASSIGN		= "="
	PLUS		= "+"
	MINUS		= "-"
	BANG		= "!"
	ASTERISK	= "*"
	SLASH		= "/"

	GT			= ">"
	LT			= "<"
	EQ			= "=="
	NEQ			= "!="

	// Delimiters
	COMMA		= ","
	SEMICOLON	= ";"

	LPAREN	= "("
	RPAREN	= ")"
	LBRACE	= "{"
	RBRACE	= "}"

	// Keywords
	FUNCTION	= "FUNCTION"
	LET			= "LET"
	RETURN		= "RETURN"
	IF			= "IF"
	ELSE		= "ELSE"
	TRUE		= "TRUE"
	FALSE		= "FALSE"
)