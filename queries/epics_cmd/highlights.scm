(comment) @comment

(string) @string
(path) @string.special.path
(escape_sequence) @string.escape
(macro_expansion) @string.special

(command_name (word) @function)
((command_name (word) @function.builtin)
 (#any-of? @function.builtin
  "date"

  "dbDumpDevice" "dbDumpDriver" "dbDumpField" "dbDumpFunction" "dbDumpMenu"
  "dbDumpPath" "dbDumpRecord" "dbDumpRecordType" "dbDumpRegistrar"
  "dbDumpVariable" "dbLoadDatabase" "dbLoadRecords" "dbLoadTemplate"

  "dba" "dbap" "dbb" "dbc" "dbcar" "dbd" "dbel" "dbgf" "dbgrep" "dbhcr" "dbior"
  "dbl" "dbla" "dblsr" "dbnr" "dbp" "dbpf" "dbpr" "dbs" "dbsr" "dbstat" "dbtgf"
  "dbtpf" "dbtpn" "dbtr"

  "echo"

  "epicsEnvSet" "epicsEnvShow" "epicsEnvUnset"

  "errlog" "errlogInit" "errlogInit2"

  "help"

  "iocInit"

  "iocLogInit" "iocLogPrefix" "iocLogShow"

  "iocPause" "iocRun"

  "iocshCmd" "iocshLoad" "iocshRun"

  "pwd"

  "system"

  "traceIocInit"

  "var"))

(argument (word) @variable.parameter)
((argument (word) @number)
  (#lua-match? @number "^[0-9]+$"))

(path (word) @variable.parameter)

[ "(" ")" ] @punctuation.bracket
[ "," ] @punctuation.delimiter
[ "<" ">" ">>" (file_descriptor) ] @operator
