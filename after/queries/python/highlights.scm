;; extends
((identifier) @dunder
  (#match? @dunder "^__.*__$"))
; ((identifier) @dunder
;   (#match? @dunder "__init__\|__name__\|__del__"))

; give type.builtin preference over other groups
((identifier) @type.builtin
 (#any-of? @type.builtin
              ;; https://docs.python.org/3/library/exceptions.html
              "BaseException" "Exception" "ArithmeticError" "BufferError" "LookupError" "AssertionError" "AttributeError"
              "EOFError" "FloatingPointError" "GeneratorExit" "ImportError" "ModuleNotFoundError" "IndexError" "KeyError"
              "KeyboardInterrupt" "MemoryError" "NameError" "NotImplementedError" "OSError" "OverflowError" "RecursionError"
              "ReferenceError" "RuntimeError" "StopIteration" "StopAsyncIteration" "SyntaxError" "IndentationError" "TabError"
              "SystemError" "SystemExit" "TypeError" "UnboundLocalError" "UnicodeError" "UnicodeEncodeError" "UnicodeDecodeError"
              "UnicodeTranslateError" "ValueError" "ZeroDivisionError" "EnvironmentError" "IOError" "WindowsError"
              "BlockingIOError" "ChildProcessError" "ConnectionError" "BrokenPipeError" "ConnectionAbortedError"
              "ConnectionRefusedError" "ConnectionResetError" "FileExistsError" "FileNotFoundError" "InterruptedError"
              "IsADirectoryError" "NotADirectoryError" "PermissionError" "ProcessLookupError" "TimeoutError" "Warning"
              "UserWarning" "DeprecationWarning" "PendingDeprecationWarning" "SyntaxWarning" "RuntimeWarning"
              "FutureWarning" "ImportWarning" "UnicodeWarning" "BytesWarning" "ResourceWarning"
              ;; https://docs.python.org/3/library/stdtypes.html
              "bool" "int" "float" "complex" "list" "tuple" "range" "str"
              "bytes" "bytearray" "memoryview" "set" "frozenset" "dict" "type"))

(function_definition
  (parameters
    (identifier)? @parameter.definition
    (typed_parameter
      (identifier) @parameter.definition)?
    (default_parameter
      (identifier) @parameter.definition)?
    (typed_default_parameter
      (identifier) @parameter.definition)?))
((identifier) @variable.builtin
 (#eq? @variable.builtin "self"))
((identifier) @variable.builtin
 (#eq? @variable.builtin "cls"))

["." ":" ";" (ellipsis)] @punctuation.normal

((string) @string.bytes
  (#match? @string.bytes "^b"))
