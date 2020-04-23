os:linux
app:gvim
app:/term/
and win.title:/VIM/
-
save: 
    key(escape)
    insert(":w\n")
save as: 
    key(escape)
    insert(":w ")
save and (quit|close): 
    key(escape)
    insert(":wq\n")
quit: 
    key(escape)
    insert(":q\n")
force quit: 
    key(escape)
    insert(":q!\n")
refresh file:
    key(escape)
    insert(":e!\n")
[(go|jump)] [to] line <number>:
    key(escape)
    key(:)
    insert("{number}")
    key(enter)

# editing
format line: "=="
delete line: "dd"
(copy|yank) line: "Y"

# buffering
buffer list: ":ls\n"
buffer close: ":bd\n"
buffer open: ":b "
(go|jump|open) buffer <number>: ":b {number}\n"

# vim windowing
split <user.vim_arrow>:
    key("ctrl-w")
    key("{vim_arrow}")
split (only|exclusive):
    key("ctrl-w")
    key("o")
## window resizing
split equalize:
    key("ctrl-w")
    key("=")
new vertical split: insert(":vsplit\n")
new split: insert(":split\n")

push:
    key(escape)
    key(A)

highlight off: ":nohl\n"

action(edit.redo): key(ctrl-r)
undo:
    key(escape)
    key(u)

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
(go|jump) [to] edit: "`."
(go|jump) [to] (cursor|location): "``"

# jump list
show jump list: ":jumps\n"
clear jump list: ":clearjumps\n"
(prev|previous|older) jump [entry]: key(ctrl-o)
(next|newer) jump [entry]: key(ctrl-i)

# misc

file info: key(ctrl-g)
extra file info:
# show buffer number by pressing 2
    key(2) 
    key(ctrl-g)

# motions:
shift right: key(>)
shift left: key(<)

vim help: ":help "

# XXX - remove the auto 'i' changes?
screen (centre|center):
    key(escape)
    insert("z.i")

screen bottom:
    key(escape)
    insert("zbi")

screen top:
    key(escape)
    insert("zti")
matching: key(%)

visual block: key(ctrl-v)

scroll top: "zt"

find:
    key(escape)
    insert("/\c")

find sensitive:
    key(escape)
    insert("/\C")

find <phrase>:
    key(escape)
    insert("/\c{phrase}\n")

find <phrase> sensitive:
    key(escape)
    insert("/\C{phrase}\n")

find <user.ordinals> <phrase>:
    key(escape)
    insert("{ordinals}/\c{phrase}\n")

find (reversed|reverse) <phrase>: 
    key(escape)
    insert("?\c{phrase}\n")

find (reversed|reverse):
    key(escape)
    insert("?\c")

find (reversed|reverse) sensitive:
    key(escape)
    insert("?\C")

# More complicated grammar comboing. Based on vimspeak. See vim.py
#<user.vim_motion_verbs>:
#    user.vim_cmd(vim_motion_verbs)

<user.vim_normal_counted_command>:
    insert("{vim_normal_counted_command}")
<user.vim_motion_verbs>:
    insert("{vim_motion_verbs}")

# Plugins
nerd tree: insert(":NERDTree\n")
nerd open <phrase>:
    insert(":NERDTree\n")
nerd find [current] file: insert(":NERDTreeFind\n")

# Personalized stuff
run as python: 
    insert(":w\n")
    insert(":exec '!python' shellescape(@%, 1)\n")

remove trailing white space: insert(":%s/\s\+$//e\n")

reselect: "gv"
swap selected:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms) 
    insert("s///g")
    key(left)
    key(left)
    key(left)

swap global:
    insert(":%s///g")
    key(left)
    key(left)
    key(left)
