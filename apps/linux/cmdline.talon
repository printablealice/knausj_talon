os: linux
app: /term/
-
(list|lisa): "ls\n"
(list|lisa) long: "ls -al\n"
(list|lisa) (deer|dir): "ls "

# directory 
(cd|deer|dir) up: "cd ..\n"
(cd|deer|dir) home: "cd\n"
(cd|deer|dir) last: "cd -\n"
make (dur|dear|dir): "mkdir "
make (dur|dear|dir) <word>: "mkdir {word}"
remove (dur|dear|dir): "rmdir "
remove (dur|dear|dir) <word>: "rmdir {word}"

# links
sim link: "ln -s "
hard link: "ln "

# file management
move: "mv "
copy: "cp "
#cat: "cat "

touch: "touch "

run that: key("ctrl-o")
clear: "clear\n"
(chuck|fuck) [that]: key("ctrl-c")

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
