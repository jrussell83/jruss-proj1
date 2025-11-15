{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let float = '-'? digit+ '.' digit+
let int = '-'? digit+
let letter = ['a'-'z' 'A'-'Z']
let id = letter+

rule read = 
  parse
  | white { read lexbuf }
  | "true" { TRUE }
  | "false" { FALSE }
  | "<=" { LEQ }
  | ">=" { GEQ }
  | "*" { TIMES }
  | "+" { PLUS }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "let" { LET }
  | "=" { EQUALS }
  | "in" { IN }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "float" { FLOAT_TYPE }
  | "int" {INT_TYPE}
  | "bool" {BOOL_TYPE}
  | ":" {COLON}
  | "/" { DIV }
  | "-" { MINUS }
  | "*." { TIMES_DOT }
  | "+." { PLUS_DOT }
  | "-." { MINUS_DOT }
  | "/." { DIV_DOT }
  | float { FLOAT (float_of_string (Lexing.lexeme lexbuf)) }
  | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | id { ID (Lexing.lexeme lexbuf) }
  | eof { EOF }
