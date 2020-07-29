mode: user.windbg
-
tag(): debugger
#tag(): windbg

action(user.debugger_step_into):
    key(t enter)
action(user.debugger_step_over):
    key(p enter)
action(user.debugger_continue):
    key(g enter)
action(user.debugger_backtrace):
    key(k enter)
action(user.debugger_show_registers):
    key(r enter)
action(user.debugger_get_register):
    key(r space)
action(user.debugger_set_register):
    insert("set $=")
    edit.left()
