[
  (field_declaration_list)
  (state_set)
  (state)
  (block)
  (member_decl)
] @indent

(block "}" @indent_end)

[
  "else"
  "}"
] @branch

(call_expression) @indent
(call_expression ")" @indent_end)

(if_statement condition: (_) @indent)

((if_statement consequence: (_) @_consequence
  (#not-has-type? @_consequence block)) @indent)
((else_statement consequence: (_) @_consequence
  (#not-has-type? @_consequence block)) @indent)
((while_statement body: (statement (_) @_body)
  (#not-has-type? @_body block)) @indent)
((for_statement body: (statement (_) @_body)
  (#not-has-type? @_body block)) @indent)

(init_declarator) @indent
(transition condition: (_) @indent)

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
