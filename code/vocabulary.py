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
    "ssh",
    "rsa",
    "ecdsa",
    "idarling",
    "rrsp",
    "tfsa",
    "mplayer",
    "hexdump",
    "hal",
    "dll",
    "relro",
    "afl",
    "binja",
    "kk",
    "cfg",
    "rop",
    "cve",
    "lambda",
    "daemon",
    "poc",
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
    "win two k three": "win2k3",
    "win two k eight": "win2k8",
    "win two k twelve": "win2k12",
    "win two k sixteen": "win2k16",
    "win two k nineteen": "win2k19",
    "as p three": "sp3",
    "as p to": "sp2",
    "as p one": "sp1",
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
    "shaw one": "sha1",
    "lib heap": "libheap",
    "hack stump": "hexdump",
    "heck stump": "hexdump",
    "of by one": "off by one",
    "her go dogs": "ergodox",
    "all i": "ollie",
    "rob": "rop",
    "gee lib see": "glibc",
    "lib see": "libc",
    "dot text": ".text",
    "dot data": ".data",
    "dot b s s": ".bss",
    "hex raise": "hexrays",
    "ma map": "mmap",
    "em protect": "mprotect",
    "stir copy": "strcpy",
    "x eighty six": "x86",
    "x sixty four": "x64",
    "sixty for bit": "64-bit",
    "thirty too bit": "32-bit",
    "base sixty four": "base64",
    "utt fight": "utf-8",
    "he low": "helo",
    "damon": "daemon",
    "frack": "phrack",
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
