# NOTE: these are command line commands, not shell-specific bindings
# see shell.talon for shell-specific keybindings
os: linux
app: /term/
not win.title: /VIM/ 
-
(list|lisa): "ls\n"
(list|lisa) long: "ls -al\n"
(list|lisa) <phrase>: "ls {phrase}"
(list|lisa) (deer|dir): "ls "

# directory and files
up (dear|dir): "../"
(cd|deer|dir) <word>: "cd {word}"
(cd|deer|dir) up: "cd ..\n"
parent (deer|dir): "cd ..\n"
(cd|deer|dir) home: "cd\n"
(cd|deer|dir) last: "cd -\n"
make (dur|dear|dir|directory): "mkdir "
make (dur|dear|dir|directory) <word>: "mkdir {word}"
remove (dur|dear|dir|directory): "rmdir "
remove (dur|dear|dir|directory) <word>: "rmdir {word}"
remove file: "rm "
tree: "tree\n"
temp (dur|dear|dir|directory): "cd /tmp\n"
pop (dur|dear|dir|directory): "popd\n"

# permissions
make executable: "chmod +x "
change ownership: "chown "

# links
sim link: "ln -s "
hard link: "ln "

# finds
list sim links: "find . -maxdepth 1 -type l  -ls\n"
list (directories|folders): "find . -maxdepth 1 -type d  -ls\n"
list files: "find . -maxdepth 1 -type f  -ls\n"

touch: "touch "
# file management
move file: "mv "
copy file: "cp "
show me <phrase>: "cat {phrase}"
show me: "cat "
less: "less "


clear [screen|page]: "clear\n"

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
generate see scope database:
    insert('find . -name "*.c"')
    insert('-o -name "*.cpp"')
    insert('-o -name "*.h"') 
    insert('-o -name "*.hpp"')
    insert('-o -name "*.py"')
    insert('-o -name "*.s"')
    insert('-o -name "*.asm"')
    insert('> cscope.files\n')
    insert("cscope -q -R -b -i cscope.files\n")

process list: "ps -ef\n"
process top: "htop\n"
locate: "locate "
(where am I|print working directory): "pwd\n"

edit here: insert("vim .\n")

edit <phrase>$:
    insert("vim {phrase}")

edit:
    insert("vim ")

# XXX - ~/.vim/sessions/<tab>
edit session:
    insert("vim -S ")

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
so do: "sudo "
d message: "dmesg"

# extraction
tar ball: "tar -"
tar ball extract [zip]: "tar -xvzf "
tar ball extract bee zip: "tar -xvjf "

curl: "curl "
double u get: "wget 

# because talent doesn't seem to like me saying ./
run script: "./"
