# XXX - support for clipboard actions
# XXX - execute until line number/cursor
# XXX - more memory printing he thumping

from talon import Module

mod = Module()
mod.tag("debugger", desc="Tag for enabling generic debugger commands")


@mod.action_class
class Actions:
    def debugger_step_into():
        """Step into an instruction in the debugger"""

    def debugger_step_over():
        """Step over an instruction in the debugger"""

    def debugger_step_line():
        """Step into a source line in the debugger"""

    def debugger_step_over_line():
        """Step over a source line in the debugger"""

    def debugger_step_out():
        """Step until function exit in the debugger"""

    def debugger_continue():
        """Continue execution in the debugger"""

    def debugger_restart():
        """Restart execution in the debugger"""

    def debugger_start():
        """Start debugging"""

    def debugger_stop():
        """Stop the debugger"""

    def debugger_exit():
        """Exit the debugger"""

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

    def debugger_break_now():
        """Break into the debugger"""

    def debugger_break_here():
        """Set a break on the current line"""

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

    def debugger_clear_breakpoint_id(number_small: int):
        """Clear one breakpoint id in the debugger"""

    def debugger_disable_breakpoint_id(number_small: int):
        """Disable one breakpoint id in the debugger"""

    def debugger_disable_breakpoint():
        """Disable one breakpoint in the debugger"""

    def debugger_disable_all_breakpoints():
        """Disable all breakpoints in the debugger"""

    def debugger_enable_breakpoint():
        """Enable one breakpoint in the debugger"""

    def debugger_enable_breakpoint_id(number_small: int):
        """Enable one breakpoint id in the debugger"""

    def debugger_enable_all_breakpoints():
        """Enable all breakpoints in the debugger"""

    def debugger_disassemble():
        """Disassemble instructions at a specific address in the debugger"""

    def debugger_disassemble_clipboard():
        """Disassemble instructions at an address in the clipboard"""

    def debugger_goto_address():
        """Jump to a specific address in the debugger"""

    def debugger_goto_clipboard():
        """Jump to a specific address stored in the clipboard"""

    def debugger_goto_highlighted():
        """Jump to a specific highlighted address in the debugger"""

    def debugger_dump_string():
        """Display as specific address as a string in the debugger"""

    def debugger_inspect_type():
        """Inspect a specific data type in the debugger"""

    def debugger_clear_line():
        """Clear unwanted data from the command line"""
