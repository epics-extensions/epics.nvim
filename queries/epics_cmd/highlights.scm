(comment) @comment

(string) @string
(escape_sequence) @string.escape
(macro_expansion) @string.special

(command_name (word) @function)
(argument (word) @parameter)
(path (word) @parameter)

[ "(" ")" ] @punctuation.bracket
[ "," ] @punctuation.delimiter
[ "<" ">" ">>" (file_descriptor) ] @operator
