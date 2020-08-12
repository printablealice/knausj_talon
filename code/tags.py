from talon import Context, Module

mod = Module()

tagList = [
    "firefox",
    "gdb",
    "windbg",
    "tmux",
    "tabs",
    "debugger",
    "disassembler",
    "ida",
]
modes = {
    "gdb": "a way to force gdb commands to be loaded",
    "windbg": "a way to force windbg commands to be loaded",
    "ida": "a way to force ida commands to be loaded",
    "debug": "a way to force debugger commands to be loaded",
    "admin": "enable extra administration commands terminal (docker, etc)",
}

for entry in tagList:
    mod.tag(entry, f"tag to load {entry} and/or related plugins ")

for key, value in modes.items():
    mod.mode(key, value)
