(comment) @comment
(macro_expansion) @epics_msi_template
(ccode) @c

;; Not really JSON, but close
(json_value) @json

(field_descriptor
 (field_item) @_extra
 value: (string (string_text_fragment) @c)
 (#eq? @_extra "extra"))
