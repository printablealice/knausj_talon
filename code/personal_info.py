import json
import os
import sys
from typing import Set

from talon import Context, Module, actions

mod = Module()

ctx = Context()

# ctx.matches = r"""
# mode: command
# """


class PersonalInfo:
    db = None

    def __init__(self):
        cwd = os.path.dirname(os.path.realpath(__file__))
        personal_info_file = os.path.join(cwd, "personal_info", "personal_info.json")
        with open(personal_info_file, "r") as f:
            self.db = json.loads(f.read())


@mod.action_class
class Actions:
    def personal_email():
        """Insert personal iemail"""
        pi = PersonalInfo()
        personal_email = pi.db["personal_email"]
        actions.insert(f"{personal_email}")
