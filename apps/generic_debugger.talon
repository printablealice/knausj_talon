tag: debugger
-

# Code execution
step into: user.debugger_step_into()
step over: user.debugger_step_over()
step out: user.debugger_step_out()

# these are multi word to avoid accidental utterance
debug stop: user.debugger_stop()
debug detach: user.debugger_detach()
debug restart: user.debugger_restart()
back trace: user.debugger_backtrace()

# Register
show registers: user.debugger_show_registers()
get register: user.debugger_get_register()
set register: user.debugger_set_register()

# Breakpoints
break now: user.debugger_break()
show (breaks|break points): user.debugger_show_breakpoints()
add (break|break point): user.debugger_add_breakpoint()
clear (breaks|break points): user.debugger_clear_breakpoints()
clear (break|break point): user.debugger_clear_breakpoint()

# Navigation


# Memory Inspection
jumped to address: user.debugger_goto_address()
