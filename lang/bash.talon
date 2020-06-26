mode: user.bash
mode: command
and code.language: bash
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

# XXX - redundant with snippets
action(user.code_state_if):
  insert("if [];")
  key(left)

# XXX - redundant with snippet
call interpreter: "#!/bin/sh\n"

# XXX - check how other talon files invoke variable names
state empty (variable|var):
    insert("${}")
    key(left)

# XXX - check how other talon files invoke variable names
state (variable|var) <user.text>$:
    insert("${")
    text = user.formatted_text(text, "snake")
    user.keys_uppercase_letters(text)
    insert("}")
    key(left)
