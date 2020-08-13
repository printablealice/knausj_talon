from talon import Context, Module, actions, ui
import time

mod = Module()
ctx = Context()

ctx.matches = r"""
mode: user.ida
"""


@mod.action_class
class Actions:
    def ida_open_general_options():
        """Open the general options menu"""
        actions.key("alt-o g")
        time.sleep(0.2)
    def accept_change():
        time.sleep(0.4)
        actions.key("enter")
