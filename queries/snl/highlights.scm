(identifier) @variable

[
 "assign"
 "const"
 "entry"
 "enum"
 "exit"
 "foreign"
 "monitor"
 "option"
 "program"
 "sizeof"
 "ss"
 "state"
 "struct"
 "sync"
 "syncq"
 "to"
 "typename"
 "union"
 "when"
 ] @keyword

"sizeof" @keyword.operator
"return" @keyword.return

[
  "while"
  "for"
  "continue"
  "break"
] @repeat

[
 "if"
 "else"
] @conditional

"#define" @constant.macro
[
 "#elif"
 "#else"
 "#endif"
 "#if"
 "#ifdef"
 "#ifndef"
 (preproc_directive)
 (line_marker)
] @keyword
"#include" @include

[ "(" ")" "[" "]" "{" "}" "%%" "%{" "}%" ] @punctuation.bracket
[ "." "," ";" ] @punctuation.delimiter
"..." @punctuation.special
[
 "+"
 "-"
 "*"
 "&"
 "!"
 "~"
 "++"
 "--"
 "="
 ">>"
 "<<"
 "/"
 ">"
 ">="
 "<"
 "<="
 "=="
 "!="
 "^"
 "|"
 "||"
 "&&"
 "%"
 "*="
 "/="
 "%="
 "+="
 "-="
 "<<="
 ">>="
 "&="
 "^="
 "|="
] @operator
(conditional_expression [ "?" ":" ] @conditional)

[
 (true)
 (false)
] @boolean

[
 (string_literal)
 (system_lib_string)
] @string
(escape_sequence) @string.escape

(null) @constant.builtin
[
 (number_literal)
 (char_literal)
] @number

[
 (preproc_arg)
 (preproc_defined)
]  @function.macro

(call_expression
  function: (identifier) @function)
(call_expression
  function: (field_expression
    field: (identifier) @function))
(function_declarator
  declarator: (identifier) @function)
(preproc_function_def
  name: (identifier) @function.special)

(field_expression
  field: (identifier) @property)

(structdef
 name: (identifier) @type)
[ (basetype) (type_expr) ] @type
(prim_type) @type.builtin

(program name: (identifier) @constant)
(state_set name: (identifier) @function)
(state name: (identifier) @function)
(transition name: (identifier) @function)
(option name: (identifier) @constant)

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z\\d_]*$"))

(preproc_def
  name: (_) @constant)
(preproc_call
  directive: (preproc_directive) @_u
  argument: (_) @constant
  (#eq? @_u "#undef"))

(comment) @comment

(param_decl
  (declarator (identifier) @parameter))

(param_decl
  (declarator (pointer_declarator) @parameter))

(preproc_params (identifier) @parameter)

(ERROR) @error
