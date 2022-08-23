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
(parameter_expansion [ "{" "}" ] @string.special)
(parameter_expansion (identifier) @constant)
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

((identifier) @parameter
 (#has-ancestor? @parameter param_decl))

(param_decl
  (declarator (pointer_declarator) @parameter))

(preproc_params (identifier) @parameter)

((call_expression function: (_) @function.builtin)
  (#any-of? @function.builtin
    "delay"
    "pvPut"
    "pvPutComplete"
    "pvArrayPutComplete"
    "pvPutCancel"
    "pvArrayPutCancel"
    "pvGet"
    "pvGetComplete"
    "pvArrayGetComplete"
    "pvGetCancel"
    "pvArrayGetCancel"
    "pvGetQ"
    "pvFreeQ"
    "pvFlushQ"
    "pvAssign"
    "pvAssignSubst"
    "pvMonitor"
    "pvArrayMonitor"
    "pvStopMonitor"
    "pvArrayStopMonitor"
    "pvSync"
    "pvArraySync"
    "pvCount"
    "pvStatus"
    "pvSeverity"
    "pvMessage"
    "pvTimeStamp"
    "pvAssigned"
    "pvConnected"
    "pvArrayConnected"
    "pvIndex"
    "pvFlush"
    "pvChannelCount"
    "pvAssignCount"
    "pvConnectCount"
    "efSet"
    "efClear"
    "efTest"
    "efTestAndClear"
    "macValueGet"
    "optGet"))

((identifier) @constant.builtin
  (#any-of? @constant.builtin
    "pvStatOK"
    "pvStatERROR"
    "pvStatDISCONN"
    "pvStatREAD"
    "pvStatWRITE"
    "pvStatHIHI"
    "pvStatHIGH"
    "pvStatLOLO"
    "pvStatLOW"
    "pvStatSTATE"
    "pvStatCOS"
    "pvStatCOMM"
    "pvStatTIMEOUT"
    "pvStatHW_LIMIT"
    "pvStatCALC"
    "pvStatSCAN"
    "pvStatLINK"
    "pvStatSOFT"
    "pvStatBAD_SUB"
    "pvStatUDF"
    "pvStatDISABLE"
    "pvStatSIMM"
    "pvStatREAD_ACCESS"
    "pvStatWRITE_ACCESS"

    "pvSevrOK"
    "pvSevrERROR"
    "pvSevrNONE"
    "pvSevrMINOR"
    "pvSevrMAJOR"
    "pvSevrINVALID"

    "DEFAULT"
    "ASYNC"
    "SYNC"

    "NOEVFLAG"))
