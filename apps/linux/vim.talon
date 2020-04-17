os:linux
app:gvim
app:/term/
and win.title:/VIM/
-
save: ":w\n"
save and (quit|close): ":wq\n"
quit: ":q\n"
force quit: ":q!\n"
(go|jump) [to] line <number>:
    key(:)
    insert("{number}")
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

# marks
mark <user.letter>:
    key(m)
    key(letter)
(go|jump) [to] mark <user.letter>:
    key(`)
    key(letter)
(del|delete) (mark|marks):
    key(escape)
    insert(":delmarks ")
(del|delete) all (mark|marks):
    key(escape)
    insert(":delmarks! ")
(list|show) [all] marks:
    key(escape)
    insert(":marks\n")
(list|show) specific marks:
    key(escape)
    insert(":marks ")

# misc

file info: key(ctrl-g)
extra file info:
# show buffer number by pressing 2
    key(2) 
    key(ctrl-g)

