# NOTE: these are command line commands, not shell-specific bindings
# see shell.talon for shell-specific keybindings
os: linux
app: /term/
-
(list|lisa): "ls\n"
(list|lisa) long: "ls -al\n"
(list|lisa) <phrase>: "ls {phrase}"
(list|lisa) (deer|dir): "ls "

# directory 
up (dear|dir): "../"
(cd|deer|dir) <word>: "cd {word}"
(cd|deer|dir) up: "cd ..\n"
parent (deer|dir): "cd ..\n"
(cd|deer|dir) home: "cd\n"
(cd|deer|dir) last: "cd -\n"
make (dur|dear|dir): "mkdir "
make (dur|dear|dir) <word>: "mkdir {word}"
remove (dur|dear|dir): "rmdir "
remove (dur|dear|dir) <word>: "rmdir {word}"
tree: "tree\n"
temp directory: "cd /tmp\n"
pop (dur|dear|dir): "popd\n"

# permissions
make executable: "chmod +x "

# links
sim link: "ln -s "
hard link: "ln "

# finds
list sim links: "find . -maxdepth 1 -type l  -ls\n"
list folders: "find . -maxdepth 1 -type d  -ls\n"
list files: "find . -maxdepth 1 -type f  -ls\n"

# file management
move: "mv "
copy: "cp "
show me <phrase>: "cat {phrase}"
show me: "cat "
less: "less "

touch: "touch "

clear: "clear\n"

# find
find file: "find . -name "
fuzzy find file:
    insert("find . -name \"**\"")
    key("left")
    key("left")

# grepping

rip: "rg -i "
rip (exact|precise): "rg "

# networking
show eye pee: "ip addr\n"
show route: "ip route\n"
see tags: "ctags --recurse *\n"

process list: "ps -ef\n"
process top: "htop\n"
locate: "locate "
(where am I|print working directory): "pwd\n"

edit here: insert("vim .\n")

edit:
    insert("vim ")

lazy edit:
    insert("vim ")
    insert("$(find . -name \"**\")")
    key("left")
    key("left")
    key("left")

lazy edit <phrase>:
    insert("vim ")
    insert("$(find . -name \"*{phrase}*\")\n")

find <phrase> inside (python|pie) files:
    insert('$(find . -name \"*.py\") | xargs rg -i "{phrase}"\n')

find <phrase> inside (python|pie) files less:
    insert('$(find . -name \"*.py\") | xargs rg -i "{phrase}\" | less\n')

man: "man "
