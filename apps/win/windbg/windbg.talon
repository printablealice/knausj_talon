mode: user.windbg
-
tag(): debugger
#tag(): windbg

##
# Generic debugger actions
##
action(user.debugger_step_into):
    key(t enter)
action(user.debugger_step_over):
    key(p enter)
action(user.debugger_step_out):
    insert("gu\n")
action(user.debugger_continue):
    key(g enter)
action(user.debugger_backtrace):
    key(k enter)
action(user.debugger_show_registers):
    key(r enter)
action(user.debugger_get_register):
    insert("r @")
action(user.debugger_set_register):
    insert("set $@=")
    edit.left()
action(user.debugger_show_breakpoints):
    insert("bl\n")


##
# Windbg specific functionality
##

open help: insert(".hh\n")

# xxx - add window switching

add microsoft symbols:
    insert("srv*C:\symbols*http://msdl.microsoft.com/download/symbols;\n")
force reload symbols:
    insert(".reload /f\n")
reload symbols:
    insert(".reload\n")
loaded modules:
    insert("lm l\n")
