from talon import Module

mod = Module()
mod.tag("debugger", desc="Tag for enabling generic debugger commands")


@mod.action_class
class Actions:
    def debugger_step_into():
        """Step into an instruction in the debugger"""

    def debugger_step_over():
        """Step over an instruction in the debugger"""

    def debugger_step_out():
        """Step until function exit in the debugger"""

    def debugger_continue():
        """Continue execution in the debugger"""

    def debugger_restart():
        """Restart execution in the debugger"""

    def debugger_stop():
        """Stop the debugger"""

    def debugger_detach():
        """Detach the debugger"""

    def debugger_backtrace():
        """Print a back trace in the debugger"""

    def debugger_get_register():
        """Print specific register in the debugger"""

    def debugger_set_register():
        """Set specific register in the debugger"""

    def debugger_show_registers():
        """Print the current registers in the debugger"""

    def debugger_break():
        """Break into the debugger"""

    def debugger_show_breakpoints():
        """Print the current breakpoints in the debugger"""

    def debugger_add_breakpoint():
        """Add one breakpoint in the debugger"""

    def debugger_clear_breakpoints():
        """Clear all breakpoints in the debugger"""

    def debugger_clear_breakpoint():
        """Clear one breakpoint in the debugger"""

    def debugger_goto_address():
        """Jump to a specific address in the debugger"""
