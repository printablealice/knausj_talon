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

    def debugger_add_sw_breakpoint():
        """Add one software breakpoint in the debugger"""

    def debugger_add_hw_breakpoint():
        """Add one hardware breakpoint in the debugger"""

    def debugger_clear_all_breakpoints():
        """Clear all breakpoints in the debugger"""

    def debugger_clear_breakpoint():
        """Clear one breakpoint in the debugger"""

    def debugger_clear_breakpoint_id(number: int):
        """Clear one breakpoint id in the debugger"""

    def debugger_disable_breakpoint_id(number: int):
        """Disable one breakpoint id in the debugger"""

    def debugger_disable_breakpoint():
        """Disable one breakpoint in the debugger"""

    def debugger_disable_all_breakpoint():
        """Disable all breakpoints in the debugger"""

    def debugger_enable_breakpoint():
        """Enable one breakpoint in the debugger"""

    def debugger_enable_breakpoint_id(number: int):
        """Enable one breakpoint id in the debugger"""

    def debugger_enable_all_breakpoint():
        """Enable all breakpoints in the debugger"""

    def debugger_goto_address():
        """Jump to a specific address in the debugger"""

    def debugger_dump_string():
        """Display as specific address as a string in the debugger"""
