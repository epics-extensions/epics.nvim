 (source_file) @scope

((record_type) @reference
 (set! reference.kind "type"))
((record_name) @reference
 (set! reference.kind "var"))
((field_name) @reference
 (set! reference.kind "field"))

(menu_definition name: (_) @definition.type)
(menu_choice name: (_) @definition.constant)

(record_type_definition name: (_) @definition.type)

(field_definition name: (_) @definition.field)
(field_definition
 type: (_) @reference
 (set! reference.kind "type"))

(record_instance name: (_) @definition.var)
(alias_statement alias_name: (_) @definition.var)
(alias alias_name: (_) @definition.var)

(field
 name: (_) @_field
 value: (string) @reference
 (#match? @_field "LNK|INP|^OUT$")
 (set! reference.kind "var"))
