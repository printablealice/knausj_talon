os:linux
app:/term/
-
save: ":w\n"
save and (quit|close): ":wq\n"
quit: ":q\n"
force quit: ":q!\n"
(go|jump) [to] line <number>:
    key(:)
    key("{number}")
    key(enter)

# buffering
buffer list: ":ls\n"
buffer close: ":bd\n"
buffer open: ":b "

# vim windowing
split right:
    key(ctrl-w)
    key(l)
split left:
    key(ctrl-w)
    key(h)
split up:
    key(ctrl-w)
    key(k)
split down:
    key(ctrl-w)
    key(j)

highlight off: ":nohl\n"

action(edit.redo): key(ctrl-r)
undo: key(u)

# symbol
jump [to] symbol: key(ctrl-])
leave symbol: key(ctrl-t)

# misc

file info: key(ctrl-g)
extra file info:
# show buffer number by pressing 2
    key(2) 
    key(ctrl-g)
