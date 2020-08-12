from talon import Module

mod = Module()
mod.tag("disassembler", desc="Tag for enabling generic disassembler commands")


@mod.action_class
class Actions:
    def disassembler_make_code():
        """Turn raw binary data into code """
