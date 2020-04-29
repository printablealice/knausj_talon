#app: python
code.language: python
-
logical and: insert(" and ")
logical or: insert(" or ")
state in: insert(" in ")
is not none: insert(" is not None")
is none: insert(" is None")
empty dict: insert("{}")
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
state import: 
    insert("import ")
state class: insert("class ")
class <phrase>:
    insert("class ")
    insert(user.formatted_text(phrase, "hammer"))
    insert("():\n")
return: "return "

private (method|function) <phrase>:
    insert("def _")
    insert(user.formatted_text(phrase, "snake"))
    insert("(self):")
    key(left)
    key(left)

public (method|function) <phrase>:
    insert("def ")
    insert(user.formatted_text(phrase, "snake"))
    insert("(self):")
    key(left)
    key(left)

(method|function) <phrase>$:
    insert("def ")
    insert(user.formatted_text(phrase, "snake"))
    insert("():")
    key(left)
    key(left)

call method <phrase>:
    key(.)
    insert(user.formatted_text(phrase, "snake"))
    insert("()")
    key(left)

call function <phrase>:
    insert(user.formatted_text(phrase, "snake"))
    insert("()")
    key(left)

capture <phrase>:
    insert("@mod.capture\ndef ")
    insert(user.formatted_text(phrase, "snake"))
    insert("(m) -> str:\n")
    insert('    "Returns a string"\n\n')
    insert("@ctx.capture(rule='{self.")
    insert(user.formatted_text(phrase, "snake"))
    insert("}')\ndef ")
    insert(user.formatted_text(phrase, "snake"))
    insert("(m) -> str:\n")
    insert('    "Returns a string"\n')
