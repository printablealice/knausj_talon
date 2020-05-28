from talon import Context, Module

# user-defined words that aren't matching in lexicon
simple_vocabulary = [
    "nmap",
    "admin",
    "Cisco",
    "Citrix",
    "VPN",
    "DNS",
    "minecraft",
    # fidget words
    "alloc",
    "asa",
    "cedric",
    "debbi",
    "dlmalloc",
    "docker",
    "edg",
    "exim",
    "ghidra",
    "ida",
    "malloc",
    "ncc group",
    "ptmalloc",
    "vim",
    "vmware",
    "neovim",
    "shellcode",
    "fuzzer",
    "meta",
    "metasploit",
    "fuzz",
    "pwn",
    "rootkit",
    "freebsd",
    "openbsd",
    "netbsd",
    "ios",
    "vimrc",
    "fastbin",
    "tcache",
    "errno",
    "dotfiles",
    "strmixalot",
    "mscope",
    "cert",
    "pfsense",
]
mapping_vocabulary = {
    "i": "I",
    "i'm": "I'm",
    "i've": "I've",
    "i'll": "I'll",
    "i'd": "I'd",
    # fidget
    "drawio": "draw.io",
    "parky": "poccy",
    "i low": "ilo",
    "win thirty two k": "win32k",
    "colonel": "kernel",
    "and u s kernel": "ntoskrnl",
    "look aside": "lookaside",
    "foss": "fuzz",
    "wind bag": "windbg",
    "pound bag": "pwndbg",
    "tea cash": "tcache",
    "as break": "sbrk",
    "i three": "i3",
    "i three wm": "i3wm",
    "steer makes a lot": "strmixalot",
    "tay yo": "teo",
    "din dns": "dynDNS",
}

mapping_vocabulary.update(dict(zip(simple_vocabulary, simple_vocabulary)))

mod = Module()


def remove_dragon_junk(word):
    return str(word).lstrip("\\").split("\\")[0]


@mod.capture(rule="({user.vocabulary} | <word>)")
def word(m) -> str:
    try:
        return m.vocabulary
    except AttributeError:
        return remove_dragon_junk(m.word)


@mod.capture(rule="(<user.word> | <phrase>)+")
def text(m) -> str:
    # todo: use actions.dicate.parse_words for better dragon support once supported
    words = str(m).split(" ")
    i = 0
    while i < len(words):
        words[i] = remove_dragon_junk(words[i])
        i += 1

    return " ".join(words)


mod.list("vocabulary", desc="user vocabulary")

ctx = Context()

# setup the word map too
ctx.settings["dictate.word_map"] = mapping_vocabulary
ctx.lists["user.vocabulary"] = mapping_vocabulary
