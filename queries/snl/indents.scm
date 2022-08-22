[
  (preproc_arg)
  (structdef)
  (funcdef)
  (while_statement)
  (for_statement)
  (state_set)
  (state)
  (block)
] @indent
(if_statement condition: (_) @indent)
(if_statement) @indent
(else_statement) @indent
(init_declarator) @indent
(transition condition: (_) @indent)

[
  "else"
  ")"
  "}"
] @branch

[
  "#define"
  "#ifdef"
  "#if"
  "#else"
  "#endif"
] @zero_indent

[
  (preproc_arg)
  (string_literal)
] @ignore

(comment) @auto
