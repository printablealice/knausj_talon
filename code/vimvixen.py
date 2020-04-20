from typing import Set

from talon import Module, actions
import sys

mod = Module()
mod.list('vimvixen',    desc='Common vimvixen')

@mod.action_class
class Actions:
    def focus_vimvixen():
        """
        Implement a trick to cause vimvixen to focus correctly. This allows us
        to run certain commands that wouldn't normally work, for instance if
        you were already in the search bar, or the url bar, etc.
        """
        actions.key("escape")
        actions.key("ctrl-f")
        actions.key("escape")
        actions.key("escape")

    def vimvixen_key(key: str):
        "Reguarly key prefixed with a focus. Helps keep the talon file clean"
        actions.user.focus_vimvixen()
        actions.key(key)

    def vimvixen_insert(text: str):
        "Reguarly key prefixed with a focus. Helps keep the talon file clean"
        actions.user.focus_vimvixen()
        actions.insert(text)
