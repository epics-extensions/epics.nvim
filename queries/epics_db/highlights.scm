(source_file) @local.scope

(record_type) @type
(builtin_record_type) @type.builtin
(field_type) @type
(builtin_field_type) @type.builtin
(string) @string

(comment) @comment

[ "${" "{" "}" "$(" "(" ")" ] @punctuation.bracket
[ "," ] @punctuation.delimiter

[
 "record"
 "field"
] @keyword
