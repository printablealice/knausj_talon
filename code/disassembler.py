from talon import Module

mod = Module()
mod.tag("disassembler", desc="Tag for enabling generic disassembler commands")


@mod.action_class
class Actions:
    # File handling
    def disassembler_open_file():
        """Open a new file for disassembly"""

    # Formatting
    def disassembler_make_array():
        """Convert into an array"""
    def disassembler_make_binary():
        """Convert into binary"""
    def disassembler_make_character():
        """Convert into character"""
    def disassembler_make_code():
        """Convert into code"""
    def disassembler_make_data():
        """Convert into data"""
    def disassembler_make_decimal():
        """Converted into decimal"""
    def disassembler_make_enum():
        """Convert into an enum"""
    def disassembler_make_hex():
        """Convert into hex"""
    def disassembler_make_string():
        """Convert into a string"""
    def disassembler_make_structure_variable():
        """Convert into a structure variable"""
    def disassembler_make_unicode():
        """Convert into unicode"""

    # Navigation
    def disassembler_entry_point():
        """Navigate to program entry point"""
    def disassembler_jump_back():
        """Navigate to previous location"""
    def disassembler_jump_address():
        """Navigate to specified address"""
    def disassembler_next_call():
        """Navigate to next function call"""
    def disassembler_previous_call():
        """Navigate to previous function call"""
    def disassembler_function_start():
        """Navigate to function start"""
    def disassembler_function_end():
        """Navigate to function end"""
    def disassembler_false_branch():
        """Fall through on false branch"""
    def disassembler_true_branch():
        """Fall through on true branch"""
    def disassembler_close_window():
        """Close the current window pane"""

    # Into windowing
    def disassembler_focus_disassembly():
        """Move focus to the disassembly window"""

    # Searching
    def disassembler_search_bytes():
        """Search for a sequence of bytes"""
    def disassembler_search_text():
        """Search for a sequence of text"""
    def disassembler_search_value():
        """Search for a sequence of value"""
    def disassembler_next_bytes():
        """Repeat search for bytes"""
    def disassembler_next_code():
        """Search for next instruction"""
    def disassembler_next_data():
        """Search for next data item"""
    def disassembler_next_explored():
        """Search for next instruction or data item"""
    def disassembler_next_text():
        """Repeat search for text"""
    def disassembler_next_unexplored():
        """Search for next unexplored byte"""
    def disassembler_next_value():
        """Repeat search for value"""
    def disassembler_next_void():
        """Repeat search for next instruction with void operand"""

# Documenting
