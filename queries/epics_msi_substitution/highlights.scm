(source_file) @local.scope

(identifier) @constant

(string) @string
(escape_sequence) @string.escape

(comment) @comment

[ "${" "{" "}" "$(" ")" ] @punctuation.bracket
"," @punctuation.delimiter
"=" @punctuation.special

[
 "pattern"
 "file"
] @keyword
