(comment) @comment

[ (variable_name) (ascii_name) (enum_constant) ] @constant
((ascii_name) @constant.builtin
 (#any-of? @constant.builtin
  "NUL" "SOH" "STX" "ETX" "EOT" "ENQ" "ACK" "BEL" "BS"  "HT" "LF" "VT"  "FF"
  "CR" "SO"  "SI"  "DLE" "DC1" "DC2" "DC3" "DC4" "NAK" "SYN" "ETB" "CAN" "EM"
  "SUB" "ESC" "FS"  "GS"  "RS"  "US"  "DEL" "SKIP"))

"=" @operator

[ (function_name) (command_name) (handler_name) ] @function

((command_name) @function.builtin
 (#any-of? @function.builtin
  "out" "in" "wait" "event" "exec" "disconnect" "connect"))

((handler_name) @function.builtin
 (#any-of? @function.builtin
  "mismatch" "writetimeout" "replytimeout" "readtimeout" "init"))

[ "{" "}" "[" "]" "(" ")" "<" ">" "/" "#/" ] @punctuation.bracket
[ "|" ";" ] @punctuation.delimiter
[ "$" "\\$" "@" "%" ] @punctuation.special

(string) @string
(escape_sequence) @constant.builtin

(format_converter) @string.special
(checksum_flag) @operator
(checksum) @function

(regex_pattern) @string.regex

(time_conversion_spec) @constant.builtin

(keyword) @keyword

(record_name) @type
(field_name) @constant

(number) @number
