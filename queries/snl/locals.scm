;; Functions definitions
(function_declarator
  declarator: (identifier) @definition.function)
(preproc_function_def
  name: (identifier) @definition.macro) @scope

(preproc_def
  name: (identifier) @definition.macro)
((identifier) @definition.parameter
 (#has-ancestor? @definition.parameter param_decl))
(init_declarator
  (declarator (identifier)) @definition.var)
(array_declarator
  (identifier) @definition.var)

;; Struct
(member_decl
  (declarator (identifier)) @definition.field)
(structdef
  name: (identifier) @definition.type)

;; References
((field_expression field: (identifier) @reference)
 (set! reference.kind "field"))
((call_expression function: (identifier) @reference)
 (set! reference.kind "call"))
((basetype (identifier) @reference)
 (set! reference.kind "type"))

;; SNL specific
(state_set name: (identifier) @definition.state_set)
(state name: (identifier) @definition)
(transition name: (identifier) @reference)

(identifier) @reference

[
 (for_statement)
 (if_statement)
 (while_statement)
 (source_file)
 (block)
 (state_set)
 (state_block)
] @scope
