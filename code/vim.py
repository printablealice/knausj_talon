# Talon VIM - ported from vimspeak: https://github.com/AshleyF/VimSpeak
#
# XXX - probably a lot of the captures could be cleaned up
# XXX - the old vim speak special characters needs to be replaced to a the
#       existing talon ones
# XXX - Add support for ordinal motions: "delete 5th word","find second <char>"
# XXX - Support more complex yanking into registers
# XXX - add fugitive mode mapping stuff. See :help fugitive
#       most of the vim cmds should be disabled while in there? longer term
#       solution for fugitive should be just adding in win.title changes
#       directly into the project and sending tpope a PR
# XXX - make context swapping commands non-insert-perserving: ex: buffer/tab
#       swaps
# XXX - move certain commands inside of vim.py so that they can be disabled in
#       terminal mode.
# XXX - have two version of most lists. "standard" and then "custom", and
#       combine them into the context lists. this should allow people to
#       maintain custom lists without merge conflicts

import time

from talon import Context, Module, actions, settings, ui

mod = Module()
ctx = Context()

# mode ids represent more generic statusline mode() values. see :help mode()
# XXX - put these in the class only at some point
NORMAL = 1
VISUAL = 2
INSERT = 3
TERMINAL = 4

ctx.lists["self.vim_arrow"] = {
    "left": "h",
    "right": "l",
    "up": "k",
    "down": "j",
}

# Specific to the vim-sorround plugin
ctx.lists["self.vim_surround_targets"] = {
    "stars": "*",
    "asterisks": "*",
    "word": "w",
    "big word": "W",
    "block": "b",
    "big block": "B",
    # Match Talon naming
    "dubstring": '"',
    "dub string": '"',
    "dubquotes": '"',
    "dub quotes": '"',
    "double quotes": '"',
    # Match Talon naming
    "quotes": "'",
    "string": "'",
    "single quotes": "'",
    "loose parens": "(",
    "loose parenthesis": "(",
    "loose angle brackets": "<",
    "loose curly braces": "{",
    "loose braces": "{",
    "loose square brackets": "[",
    "loose brackets": "[",
    "tight parens": ")",
    "tight parenthesis": ")",
    "tight angle brackets": ">",
    "tight curly braces": "}",
    "tight braces": "}",
    "tight square brackets": "]",
    "tight brackets": "]",
    "parens": ")",
    "parenthesis": ")",
    "angle brackets": ">",
    "angles": ">",
    "curly braces": "}",
    "braces": "}",
    "square brackets": "]",
    "squares": "]",
    "brackets": "]",
    "backticks": "`",
    "sentence": "s",
    "paragraph": "p",
    "space": "  ",  # double spaces is required because surround gets confused
    "spaces": "  ",
    "tags": "t",
    "h1 tags": "<h1>",
    "h2 tags": "<h2>",
    "div tags": "<div>",
    "bold tags": "<b>",
}

# XXX - need to break into normal, visual, etc
ctx.lists["self.vim_counted_actions"] = {
    "after": "a",
    "append": "a",
    "after line": "A",
    "append line": "A",
    "insert": "i",
    "insert column zero": "gI",
    # "open": "o",  # conflicts too much with other commands
    "open below": "o",
    "open above": "O",
    "substitute": "s",
    "substitute line": "S",
    "undo": "u",
    "undo line": "U",
    # XXX - fix this control char
    "redo": "<C-r>",
    "erase": "x",
    "erase reversed": "X",
    "erase back": "X",
    "put": "p",
    "put below": "p",
    "paste": "p",
    "paste below": "p",
    "put before": "P",
    "paste before": "P",
    "put above": "P",
    "paste above": "P",
    "repeat": ".",
    # XXX - fix these control characters
    "scroll up": "<C-y>",
    "scroll down": "<C-e>",
    "page down": "<C-f>",
    "page up": "<C-b>",
    "half page down": "<C-d>",
    "half page up": "<C-u>",
    "indent line": ">>",
    "unindent line": "<<",
    "scroll left": "zh",
    "scroll right": "zl",
    "scroll half screen left": "zH",
    "scroll half screen right": "zL",
    "scroll start": "zs",
    "scroll end": "ze",
    # XXX - these work from visual mode and normal mode
    "insert before line": "I",
    "insert line": "I",
    "play again": "@@",
    "toggle case": "~",
    # XXX - custom
    "panic": "u",
}


ctx.lists["self.vim_jump_range"] = {
    "jump to line of": "'",
    "jump to character of": "`",
}

ctx.lists["self.vim_jumps"] = {
    "start of last selection": "<",
    "end of last selection": ">",
    "latest jump": "'",
    "last exit": '"',
    "last insert": "^",
    "last change": ".",
}

# XXX see about replacing the play word with something that doesn't conflict
# with an existing talon grammar
ctx.lists["self.vim_counted_actions_args"] = {
    "play macro": "@",  # takes char arg
}

# normal mode commands that require motion, and that are counted
# includes motions and no motions :|
commands_with_motion = {
    # no motions
    "join": "J",
    "filter": "=",  # XXX - not sure about how to use this
    "put": "p",
    "paste": "p",
    "undo": "u",
    "swap case": "~",
    # motions
    "change": "c",
    "delete": "d",
    "indent": ">",
    "unindent": "<",
    "an indent": "<",
    "un indent": "<",
    "yank": "y",  # XXX - conflicts with talon 'yank' alphabet for 'y' key
    "copy": "y",
    "fold": "zf",
    "format": "gq",
    "to upper": "gU",
    "to lower": "gu",
}

# only relevant when in visual mode. these will have some overlap with
# commands  and commands_with_motion above. this is mostly because
# some characters differ, and also in visual mode they don't have motions
visual_commands = {
    # normal overlap
    "change": "c",
    "join": "J",
    "delete": "d",
    "yank": "Y",  # XXX - conflicts with talon 'yank' alphabet for 'y' key
    "copy": "Y",
    "format": "gq",
    "fold": "zf",
    # some visual differences
    "to upper": "U",
    "to lower": "u",
    "swap case": "~",
    "opposite": "o",
    # counted
    "indent": ">",
    "unindent": "<",
    "an indent": "<",
    "un indent": "<",
}


ctx.lists["self.vim_motion_commands"] = list(
    set().union(commands_with_motion.keys(), visual_commands.keys())
)


ctx.lists["self.vim_motions"] = {
    "back": "b",
    "back word": "b",
    "big back": "B",
    "big back word": "B",
    # XXX - this conflicts with default talon 'end' key pressing
    "end": "e",
    "end word": "e",
    "big end": "E",
    "word": "w",
    "words": "w",
    "big word": "W",
    "big words": "W",
    "back end": "ge",
    "back end": "ge",
    "back big end": "gE",
    # XXX - see if there's a way to replaces with normal arrow keys
    "left": "h",
    "down": "j",
    "up": "k",
    "next": "n",
    "next reversed": "N",
    "previous": "N",
    "column zero": "0",
    "column": "|",
    "start of line": "^",
    "end of line": "$",
    "search under cursor": "*",
    "search under cursor reversed": "#",
    "again": ";",
    "again reversed": ",",
    "down sentence": ")",
    "sentence": ")",
    "up sentence": "(",
    "down paragraph": "}",
    "paragraph": "}",
    "up paragraph": "{",
    "start of next section": "]]",
    "start of previous section": "[[",
    "end of next section": "][",
    "end of previous section": "[]",
    "matching": "%",
    "down line": "+",
    "up line": "-",
    "first character": "_",
    "cursor home": "H",
    "cursor middle": "M",
    "cursor last": "L",
    "start of document": "gg",
    "start of file": "gg",
    "top of document": "gg",
    "top of file": "gg",
    "end of document": "G",
    "end of file": "G",
    # XXX - these need to be keys
    "retrace movements": "ctrl-o",
    "retrace movements forward": "ctrl-i",
    # todo - convenience
    "function start": "[[",
    "funk start": "[[",
    "next function": "]]",
    "next funk": "]]",
}

# all of these motions take a character argument
ctx.lists["self.vim_motions_with_character"] = {
    "jump to mark": "'",
    "find": "f",
    "find reversed": "F",
    "till": "t",
    "till reversed": "T",
}

# all of these motions take a phrase argument
ctx.lists["self.vim_motions_with_phrase"] = {
    "search": "/",
    "search reversed": "?",
}

ctx.lists["self.vim_text_object_count"] = {
    "two": "2",
    "three": "3",
    "four": "4",
    "five": "5",
    "six": "6",
    "seven": "7",
    "eight": "8",
    "nine": "9",
}

ctx.lists["self.vim_text_object_range"] = {
    "inner": "i",
    "inside": "i",
    "around": "a",
    "this": "a",
}

ctx.lists["self.vim_text_object_select"] = {
    "word": "w",
    "words": "w",
    "big word": "W",
    "big words": "W",
    "block": "b",
    "blocks": "b",
    "big block": "B",
    "big blocks": "B",
    # Match talon naming (vimspeak used 'quote' for ")
    "dubquote": '"',
    "dub quote": '"',
    "double quotes": '"',
    # Match talon naming
    "quote": "'",
    "single quotes": "'",
    "ticks": "'",
    "parens": "(",
    "parenthesis": "(",
    "angle brackets": "<",
    # These are pluralized because of how you speak vim grammars
    # ex: yank inside braces
    "curly braces": "{",
    "braces": "{",
    "square brackets": "[",
    "squares ": "[",
    "brackets": "[",
    "backticks": "`",
    "sentence": "s",
    "sentences": "s",
    "paragraph": "p",
    "paragraphs": "p",
    "tag block": "t",
}

mod.tag("vim", desc="a tag to load various vim plugins")
mod.setting(
    "vim_preserve_insert_mode",
    type=int,
    default=1,
    desc="If normal mode actions are called from insert mode, stay in insert",
)
mod.setting(
    "vim_adjust_modes",
    type=int,
    default=1,
    desc="User wants talon to automatically adjust modes for commands",
)
mod.setting(
    "vim_notify_mode_changes",
    type=int,
    default=0,
    desc="Notify user about vim mode changes as they occur",
)

# Standard VIM motions and action
mod.list("vim_arrow", desc="All vim direction keys")
mod.list("vim_motion_commands", desc="Counted VIM commands with motions")
mod.list("vim_counted_motions", desc="Counted VIM motion verbs")
mod.list("vim_counted_actions", desc="Counted VIM action verbs")
mod.list("vim_normal_counted_action", desc="Normal counted VIM actions")
mod.list("vim_motions", desc="Non-counted VIM motions")
mod.list("vim_motions_with_character", desc="VIM motion verbs with char arg")
mod.list("vim_motions_with_phrase", desc="VIM motion verbs with phrase arg")
mod.list("vim_motions_all", desc="All VIM motion verbs")
mod.list("vim_text_object_count", desc="VIM text object counting")
mod.list("vim_text_object_range", desc="VIM text object ranges")
mod.list("vim_text_object_select", desc="VIM text object selections")
mod.list("vim_jump_range", desc="VIM jump ranges")
mod.list("vim_jumps", desc="VIM jump verbs")
mod.list("vim_jump_targets", desc="VIM jump targets")
mod.list("vim_normal_counted_motion_command", desc="Counted normal VIM commands")
mod.list("vim_select_motion", desc="VIM visual mode selection motions")
mod.list("vim_any", desc="All vim commands")

# Plugin-specific lists
mod.list("vim_surround_targets", desc="VIM surround plugin targets")

# Plugin modes
mod.mode("vim_fugitive", desc="A fugitive mode that exposes git mappings")


@mod.capture
def vim_arrow(m) -> str:
    "An arrow to be converted to vim direction"


@mod.capture
def vim_surround_targets(m) -> str:
    "Returns a string"


@mod.capture
def vim_select_motion(m) -> str:
    "Returns a string"


@mod.capture
def vim_counted_actions(m) -> str:
    "Returns a string"


@mod.capture
def vim_normal_counted_action(m) -> str:
    "Returns a string"


@mod.capture
def vim_jump_targets(m) -> str:
    "Returns a string"


@mod.capture
def vim_jumps(m) -> str:
    "Returns a string"


@mod.capture
def vim_jump_range(m) -> str:
    "Returns a string"


@mod.capture
def vim_text_object_count(m) -> str:
    "Returns a string"


@mod.capture
def vim_text_object_range(m) -> str:
    "Returns a string"


@mod.capture
def vim_text_object_select(m) -> str:
    "Returns a string"


@mod.capture
def vim_motion_commands(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motion_command(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_counted_motions(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motions(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motions_with_upper_character(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motions_with_character(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motions_with_phrase(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motions_all(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_motions_all_adjust(m) -> str:
    "Returns a list of verbs"


@mod.capture
def vim_any(m) -> str:
    "Any one key"


@mod.capture
def vim_text_objects(m) -> str:
    "Returns a string"


@mod.capture
def vim_unranged_surround_text_objects(m) -> str:
    "Returns a string"


@mod.capture
def vim_normal_counted_motion_command(m) -> str:
    "Returns a string"


@ctx.capture(rule="{self.vim_arrow}")
def vim_arrow(m):
    return m.vim_arrow


@ctx.capture(rule="{self.vim_text_object_select}")
def vim_text_object_select(m) -> str:
    "Returns a string"
    return m.vim_text_object_select


@ctx.capture(rule="{self.vim_text_object_range}")
def vim_text_object_range(m) -> str:
    "Returns a string"
    return m.vim_text_object_range


@ctx.capture(rule="{self.vim_text_object_count}")
def vim_text_object_count(m) -> str:
    "Returns a string"
    return m.vim_text_object_count


@ctx.capture(rule="{self.vim_motions}")
def vim_motions(m) -> str:
    return m.vim_motions


@ctx.capture(
    rule="{self.vim_motions_with_character} (ship|upper|uppercase) <user.letter>$"
)
def vim_motions_with_upper_character(m) -> str:
    return m.vim_motions_with_character + "".join(list(m)[2:]).upper()


@ctx.capture(
    rule="{self.vim_motions_with_character} (<user.letter>|<user.number>|<user.symbol>)$"
)
# @ctx.capture(rule='{self.vim_motions_with_character} <user.any>')
def vim_motions_with_character(m) -> str:
    return m.vim_motions_with_character + "".join(list(m)[1:])


@ctx.capture(rule="{self.vim_motions_with_phrase} <phrase>")
def vim_motions_with_phrase(m) -> str:
    return "".join(list(m.vim_motions_with_phrase + m.phrase))


@ctx.capture(
    rule="(<self.vim_motions>|<self.vim_motions_with_character>|<self.vim_motions_with_upper_character>|<self.vim_motions_with_phrase>)$"
)
def vim_motions_all(m) -> str:
    return "".join(list(m))


@ctx.capture(
    rule="(<self.vim_motions>|<self.vim_motions_with_character>|<self.vim_motions_with_upper_character>|<self.vim_motions_with_phrase>)$"
)
def vim_motions_all_adjust(m) -> str:
    v = VimMode()
    v.adjust_mode([NORMAL, VISUAL])
    return "".join(list(m))


@ctx.capture(rule="{self.vim_counted_actions}")
def vim_counted_actions(m) -> str:
    return m.vim_counted_actions


@ctx.capture(rule="[<self.number>] <self.vim_motions_all>$")
def vim_counted_motions(m) -> str:
    return "".join(list(m))


@ctx.capture(rule="{self.vim_jump_range}")
def vim_jump_range(m) -> str:
    return m.vim_jump_range


@ctx.capture(rule="{self.vim_jumps}")
def vim_jumps(m) -> str:
    return m.vim_jumps


@ctx.capture(rule="{self.vim_surround_targets}")
def vim_surround_targets(m) -> str:
    return m.vim_surround_targets


@ctx.capture(rule="<self.vim_jump_range> <self.vim_jumps>$")
def vim_jump_targets(m) -> str:
    return "".join(list(m))


@ctx.capture(
    rule="[<self.vim_text_object_count>] <self.vim_text_object_range> <self.vim_text_object_select>$"
)
def vim_text_objects(m) -> str:
    return "".join(list(m))


# XXX - clarify this comment
# when speaking adding in the object ranges a little bit annoying, so it's a
# little bit and more natural to just assume that you mean around if you didn't
# say anything
@ctx.capture(rule="[<self.vim_text_object_count>] <self.vim_text_object_select>$")
def vim_unranged_surround_text_objects(m) -> str:
    if len(list(m)) == 1:
        return "a" + "".join(list(m))
    else:
        return "".join(list(m)[0:1]) + "a" + "".join(list(m)[1:])


@ctx.capture(rule="{self.vim_motion_commands}$")
def vim_motion_commands(m) -> str:
    v = VimMode()
    if v.is_visual_mode():
        if str(m) in visual_commands:
            print("issuing visual mode command")
            return visual_commands[str(m)]
    # Note this throws away commands that matched visual mode only stuff,
    # because if not in visual mode already, there is no selection anyway so
    # the command is moot
    elif str(m) not in commands_with_motion:
        print("no match for {}".format(str(m)))
        return None

    v.set_normal_mode()
    return commands_with_motion[str(m)]


@ctx.capture(
    rule="[<self.number>] <self.vim_motion_commands> [(<self.vim_motions_all> | <self.vim_text_objects> | <self.vim_jump_targets>)]$"
)
def vim_normal_counted_motion_command(m) -> str:
    return "".join(list(m))


@ctx.capture(rule="[<self.number>] <self.vim_counted_actions>$")
def vim_normal_counted_action(m) -> str:
    # XXX - may need to do action-specific mode checking
    v = VimMode()
    v.adjust_mode([NORMAL, VISUAL])

    # XXX - This is to save me from myself. Often I will say `delete line` and
    # it will trigger `@delete` and `@nine`. This then keys 9. I then say
    # `undo` to fix the bad delete, which does 9 undos. Chaos ensues.. the
    # caveat is you can't do counted undoes, unless you use ordinals
    if m.vim_counted_actions == "u":
        actions.key("escape")
        time.sleep(0.2)
    return "".join(list(m))


@ctx.capture(
    rule="[<self.number>] (<self.vim_motions> | <self.vim_text_objects> | <self.vim_jump_targets>)$"
)
def vim_select_motion(m) -> str:
    return "".join(list(m))


@mod.action_class
class Actions:
    def vim_set_normal_mode():
        """set normal mode"""
        v = VimMode()
        v.set_normal_mode()

    def vim_set_normal_mode_np():
        """set normal mode"""
        v = VimMode()
        v.set_normal_mode_np(auto=True)

    def vim_set_visual_mode():
        """set visual mode"""
        v = VimMode()
        v.set_visual_mode()

    def vim_set_insert_mode():
        """set insert mode"""
        v = VimMode()
        v.set_insert_mode()

    def vim_set_terminal_mode():
        """set terminal mode"""
        v = VimMode()
        v.set_terminal_mode()

    def vim_normal_mode(cmd: str):
        """run a given list of commands in normal mode, preserve INSERT"""
        v = VimMode()
        v.set_normal_mode()
        actions.insert(cmd)

    def vim_normal_mode_np(cmd: str):
        """run a given list of commands in normal mode, don't preserve INSERT"""
        v = VimMode()
        v.set_normal_mode_np()
        actions.insert(cmd)

    def vim_normal_mode_key(cmd: str):
        """run a given list of commands in normal mode"""
        v = VimMode()
        v.set_normal_mode()
        actions.key(cmd)

    def vim_visual_mode(cmd: str):
        """run a given list of commands in visual mode"""
        v = VimMode()
        v.set_visual_mode()
        actions.insert(cmd)

    def vim_insert_mode(cmd: str):
        """run a given list of commands in insert mode"""
        v = VimMode()
        v.set_insert_mode()
        actions.insert(cmd)

    # Sometimes the .talon file won't know what mode to run something in, just
    # that it needs to be a mode that supports motions like normal and visual.
    def vim_any_motion_mode(cmd: str):
        """run a given list of commands in normal mode"""
        v = VimMode()
        v.set_any_motion_mode()
        actions.insert(cmd)


class VimMode:
    # XXX - not really necessary here, but just used to sanity check for now
    # MODE:<mode()> is actually right for now.
    vim_modes = {
        "n": "Normal",
        "no": "N Operator Pending",
        "v": "Visual",
        "V": "V Line",
        "^V": "V-Block",
        "s": "Select",
        "S": "S·Line",
        "i": "Insert",
        "R": "Replace",
        "Rv": "V·Replace",
        "c": "Command",
        "cv": "Vim Ex",
        "ce": "Ex",
        "r": "Prompt",
        "rm": "More",
        "r?": "Confirm",
        "!": "Shell",
        "t": "Terminal",
    }

    def __init__(self):
        # list of all vim instances talon is aware of
        self.vim_instances = []
        self.current_rpc = None
        self.normal_modes = ["n"]
        self.visual_modes = ["v", "V", "^V"]
        self.current_mode = self.get_active_mode()

    def is_normal_mode(self):
        return self.current_mode == "n"

    def is_visual_mode(self):
        return self.current_mode in ["v", "V", "^V"]

    def is_insert_mode(self):
        return self.current_mode == "i"

    def is_terminal_mode(self):
        return self.current_mode == "t"

    def get_active_mode(self):
        title = ui.active_window().title
        mode = None
        if "MODE:" in title:
            mode = title.split("MODE:")[1].split(" ")[0]
            if mode not in self.vim_modes.keys():
                return None
            self.current_mode = mode
        return mode

    # XXX - not used currently
    def get_active_rpc(self):
        title = ui.active_window().title
        if "RPC" in title:
            named_pipe = title.split("RPC:")[1].split(" ")[0]
            return named_pipe
        return None

    def current_mode_id(self):
        if self.is_normal_mode():
            return NORMAL
        elif self.is_visual_mode():
            return VISUAL
        elif self.is_insert_mode():
            return INSERT
        elif self.is_terminal_mode():
            return TERMINAL

    def set_normal_mode(self):
        self.adjust_mode(NORMAL)

    # XXX - fix the auto stuff, maybe have separate method version or something
    def set_normal_mode_np(self, auto=True):
        self.adjust_mode(NORMAL, no_preserve=True, auto=auto)

    def set_visual_mode(self):
        self.adjust_mode(VISUAL)

    def set_visual_mode_np(self):
        self.adjust_mode(VISUAL, no_preserve=True)

    def set_insert_mode(self):
        self.adjust_mode(INSERT)

    def set_terminal_mode(self):
        self.adjust_mode(TERMINAL)

    def set_any_motion_mode(self):
        self.adjust_mode([NORMAL, VISUAL])

    def set_any_motion_mode_np(self):
        self.adjust_mode(NORMAL, no_preserve=True)

    def adjust_mode(self, valid_mode_ids, no_preserve=False, auto=True):
        if auto is True and settings.get("user.vim_adjust_modes") == 0:
            return

        cur = self.current_mode_id()
        print("Current mode is {}".format(cur))
        if type(valid_mode_ids) != list:
            valid_mode_ids = [valid_mode_ids]
        if cur not in valid_mode_ids:
            # Just favor the first mode
            self.set_mode(valid_mode_ids[0], no_preserve=no_preserve)

    # XXX - we need to switch this to neovim RPC, etc
    # for we simply use keyboard binding combinations
    def set_mode(self, wanted_mode, no_preserve=False):
        current_mode = self.get_active_mode()

        if current_mode == wanted_mode or (
            self.is_terminal_mode() and wanted_mode == INSERT
        ):
            print("already in wanted mode")
            return

        print("Setting mode to {}".format(wanted_mode))
        # enter normal mode where necessary
        if self.is_terminal_mode():
            # break out of terminal mode
            actions.key("ctrl-\\")
            actions.key("ctrl-n")
        elif self.is_insert_mode():
            if (
                wanted_mode == NORMAL
                and no_preserve is False
                and settings.get("user.vim_preserve_insert_mode") >= 1
            ):
                print("preserving insert mode")
                actions.key("ctrl-o")
            else:
                print("entering normal mode")
                actions.key("right")
                actions.key("escape")
                time.sleep(0.2)
                #
        elif self.is_visual_mode():
            print("entering normal mode")
            actions.key("escape")
            time.sleep(0.2)

        # switch to explicit mode if necessary
        if wanted_mode == INSERT:
            actions.key("i")
        # XXX - need to support other mode changes
        # or just let the original 'mode' command run from this point
        elif wanted_mode == VISUAL:
            actions.key("v")

        # Here we assume we are now in some normalized state:
        # need to make the notify command configurable
        if settings.get("user.vim_notify_mode_changes") >= 1:
            # user.system_command("notify-send.sh -t 3000 \"{} mode\").format()
            ...
