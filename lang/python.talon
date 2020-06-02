mode: user.python
mode: command
and code.language: python
-
####
# Operators
####
logical and: " and "
logical or: " or "
state in: " in "
is not none: " is not None"
is none: "  None"
empty dict: "{}"
word (dickt | dictionary): "dict"
state (def | deaf | deft): "def "
state else if:
    insert("elif :")
    edit.left()
state if:
    insert("if :")
    edit.left()
state else: "else:"
state self: "self"
state while:
    insert("while ()")
    edit.left()
state for: "for "
class <user.text>:
    insert("class ")
    insert(user.formatted_text(text, "hammer"))
    insert("():\n")
state switch:
    insert("switch ()")
    edit.left()
state case:
    insert("case \nbreak;")
    edit.up()
state goto:
    insert("goto ")
state import:
    insert("import ")
state class: "class "
state include: "#include "
state include system:
    insert("#include <>")
    edit.left()
state include local:
    insert('#include ""')
    edit.left()
state type deaf: "typedef "
state type deaf struct:
    insert("typedef struct")
    insert("{{\n\n}}")
    edit.up()
    key(tab)
comment py: "# "
dunder in it: "__init__"
self taught: "self."
from import:
    insert("from import ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
for in:
    insert("for in ")
    key(left)
    edit.word_left()
    key(space)
    edit.left()
dock string:
    insert("\"\"\"")
    insert("\"\"\"")
    edit.left()
    edit.left()
    edit.left()

####
# Keywords
####
return: "return "
none: "None"
true: "True"
false: "False"
pass: "pass"
self: "self"

####
# Miscellaneous
####
define private (method|function) <user.text>:
    insert("def _")
    insert(user.formatted_text(text, "snake"))
    insert("(self):")
    key(left)
    key(left)

define public (method|function) <user.text>:
    insert("def ")
    insert(user.formatted_text(text, "snake"))
    insert("(self):")
    key(left)
    key(left)

define (method|function) <user.text>$:
    insert("def ")
    insert(user.formatted_text(text, "snake"))
    insert("():")
    key(left)
    key(left)

call method <user.text>:
    key(.)
    insert(user.formatted_text(text, "snake"))
    insert("()")
    key(left)

call [function] <user.text>:
    insert(user.formatted_text(text, "snake"))
    insert("()")
    key(left)

capture <user.text>:
    insert("@mod.capture\ndef ")
    insert(user.formatted_text(text, "snake"))
    insert("(m) -> str:\n")
    insert('    "Returns a string"\n\n')
    insert("@ctx.capture(rule='{self.")
    insert(user.formatted_text(text, "snake"))
    insert("}')\ndef ")
    insert(user.formatted_text(text, "snake"))
    insert("(m) -> str:\n")
    insert('    "Returns a string"\n')

pie test: "pytest"
