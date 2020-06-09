from talon import Context, Module

# user-defined words that aren't matching in lexicon
simple_vocabulary = [
    "Cisco",
    "Citrix",
    "DNS",
    "VPN",
    "admin",
    "afl",
    "alloc",
    "asa",
    "binja",
    "blah",
    "byte",
    "bytes",
    "cedric",
    "cert",
    "cfg",
    "cve",
    "daemon",
    "debbi",
    "dll",
    "dlmalloc",
    "docker",
    "dotfiles",
    "ecdsa",
    "edg",
    "errno",
    "exim",
    "fastbin",
    "firefox",
    "freebsd",
    "fuzz",
    "fuzzer",
    "ghidra",
    "github",
    "hal",
    "hexdump",
    "ida",
    "idarling",
    "ios",
    "kk",
    "lambda",
    "malloc",
    "meta",
    "metasploit",
    "minecraft",
    "mplayer",
    "mscope",
    "ncc group",
    "neovim",
    "netbsd",
    "nmap",
    "openbsd",
    "patreon",
    "pfsense",
    "poc",
    "ptmalloc",
    "pwn",
    "relro",
    "rootkit",
    "rop",
    "rrsp",
    "rsa",
    "shellcode",
    "ssh",
    "strmixalot",
    "tcache",
    "tfsa",
    "vim",
    "vimrc",
    "vmware",
]

mapping_vocabulary = {
    "all i": "ollie",
    "and u s kernel": "ntoskrnl",
    "as break": "sbrk",
    "as p one": "sp1",
    "as p three": "sp3",
    "as p to": "sp2",
    "base sixty four": "base64",
    "colonel": "kernel",
    "damon": "daemon",
    "din dns": "dynDNS",
    "dot b s s": ".bss",
    "dot data": ".data",
    "dot text": ".text",
    "drawio": "draw.io",
    "em protect": "mprotect",
    "ex ease": "exes",
    "ex ee": "exe",
    "fast bin": "fastbin",
    "foss": "fuzz",
    "frack": "phrack",
    "gee lib see": "glibc",
    "hack stump": "hexdump",
    "he low": "helo",
    "heck stump": "hexdump",
    "her go dogs": "ergodox",
    "hex raise": "hexrays",
    "higher key": "heirarchy",
    "i low": "ilo",
    "i three wm": "i3wm",
    "i three": "i3",
    "i": "I",
    "i'd": "I'd",
    "i'll": "I'll",
    "i'm": "I'm",
    "i've": "I've",
    "lib heap": "libheap",
    "lib see": "libc",
    "look aside": "lookaside",
    "ma map": "mmap",
    "no prob": "np",
    "of by one": "off by one",
    "parky": "poccy",
    "pound bag": "pwndbg",
    "rob": "rop",
    "shaw one": "sha1",
    "sixty for bit": "64-bit",
    "steer makes a lot": "strmixalot",
    "stir copy": "strcpy",
    "tay yo": "teo",
    "tea cash": "tcache",
    "thirty too bit": "32-bit",
    "two key eight": "2k8",
    "two key nineteen": "2k19",
    "two key sixteen": "2k16",
    "two key three": "2k3",
    "two key twelve": "2k12",
    "utt fight": "utf-8",
    "win thirty two k": "win32k",
    "win two key eight": "win2k8",
    "win two key nineteen": "win2k19",
    "win two key sixteen": "win2k16",
    "win two key three": "win2k3",
    "win two key twelve": "win2k12",
    "wind bag": "windbg",
    "x eighty six": "x86",
    "x sixty four": "x64",
    "key pass": "keepass",
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
