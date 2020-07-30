mode: user.windbg
-
tag(): debugger
#tag(): windbg

##
# Generic debugger actions
##
action(user.debugger_step_into):
    key(f8)
action(user.debugger_step_over):
    key(f10)
action(user.debugger_step_out):
    insert("shift-f11")
action(user.debugger_continue):
    key(f5)
action(user.debugger_stop):
    key(shift-f5)
action(user.debugger_restart):
    key(ctrl-shift-f5)
action(user.debugger_detach):
# XXX - trigger alt-1 to hit command window?
    insert(".detach")
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
action(user.debugger_break):
    insert("ctrl-break")

action(user.debugger_goto_address):
    insert("ctrl-g")


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

display pointers:
    insert("dps ")

show version: key(ctrl-alt-w)

##
# Windows
##

view command: key(alt-1)
view watch: key(alt-2)
view locals: key(alt-3)
view registers: key(alt-4)
view memory: key(alt-5)
view call stack: key(alt-6)
view disassembly: key(alt-7)
view scratch pad: key(alt-8)
view (processes|threads): key(alt-9)
