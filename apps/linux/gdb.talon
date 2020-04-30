os: linux
app: /term/
win.title: /gdb/
-

# information
list [source]: "list\n"
info source: "info source\n"

# breakpoints
(list|show) breakpoints: "info breakpoints\n"
break: "break "

restart [program]: "r\n"
(go|continue): "c\n"
back trace: "bt\n"
quit: "quit\n"
info inferiors: "info inferiors\n"
inferior: "inferior"
