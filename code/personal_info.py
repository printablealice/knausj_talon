import json
import os
import sys
from typing import Set

from talon import Context, Module, actions, imgui, ui

mod = Module()
mod.mode("personal_info")
mod.setting(
    "pii_auto_select_first_entry",
    type=int,
    default=1,
    desc="Auto select first entry in json list",
)
ctx = Context()

# ctx.matches = r"""
# mode: command
# """

main_screen = ui.main_screen()

active_word_list = None


def close_personal_info():
    gui.hide()
    actions.mode.disable("user.personal_info")


@imgui.open(y=0, x=main_screen.width / 2.6, software=False)
def gui(gui: imgui.GUI):
    global personal_info_list
    gui.text("Select an entry")
    gui.line()
    index = 1
    for word in personal_info_list:
        gui.text("Pick {}: {} ".format(index, word))
        index = index + 1

    if gui.button("Hide"):
        close_homophones()


class PersonalInfo:
    db = None

    def __init__(self):
        cwd = os.path.dirname(os.path.realpath(__file__))
        personal_info_file = os.path.join(cwd, "personal_info", "personal_info.json")
        with open(personal_info_file, "r") as f:
            self.db = json.loads(f.read())


def raise_personal_info():
    actions.mode.enable("user.homophones")
    gui.freeze()


@mod.action_class
class Actions:
    def personal_info_hide():
        """Hides the personal_info display"""
        close_personal_info()

    def personal_info(record: str):
        """Insert some info from the personal info database"""
        global personal_info_list
        pi = PersonalInfo()
        record_data = pi.db[record]
        if type(record_data) == list:
            if len(record_data) > 1:
                personal_info_list = record_data
                raise_personal_info()
            else:
                record_data = record_data[0]
                actions.insert(f"{record_data}")
        else:
            actions.insert(f"{record_data}")

    def personal_info_select(number: int):
        """selects the personal_info by number"""
        if number <= len(personal_info_list) and number > 0:
            return personal_info_list[number - 1]

        error = "personal_info.py index {} is out of range (1-{})".format(
            number, len(personal_info_list)
        )
        app.notify(error)
        raise error
