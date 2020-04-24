# XXX - globalReplace
[you] surround and indent line with <user.vim_surround_targets>:
    insert("yss{vim_surround_targets}")


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

# XXX - which to a generic number grammar: like mixed_number
[(go|jump)] [to] line <number>:
    key(escape)
    key(:)
    insert("{number}")
    key(enter)

[(go|jump)] [to] line <digits> <number>:
    key(escape)
    key(:)
    insert("{digits}{number}")
    key(enter)

[(go|jump)] [to] line <digits>:
    key(escape)
    key(:)
    insert("{digits}")
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
set highlight search: ":set hls\n"
set no highlight search: ":set nohls\n"

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

# macros
play macro <user.letter>: "@{letter}"
record macro <user.letter>: "q{letter}"
stop recording: key(q)

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

search:
    key(escape)
    insert("/\c")

search sensitive:
    key(escape)
    insert("/\C")

search <phrase>:
    key(escape)
    insert("/\c{phrase}\n")

search <phrase> sensitive:
    key(escape)
    insert("/\C{phrase}\n")

search <user.ordinals> <phrase>:
    key(escape)
    insert("{ordinals}/\c{phrase}\n")

search (reversed|reverse) <phrase>: 
    key(escape)
    insert("?\c{phrase}\n")

search (reversed|reverse):
    key(escape)
    insert("?\c")

search (reversed|reverse) sensitive:
    key(escape)
    insert("?\C")

# More complicated grammar comboing. Based on vimspeak. See vim.py
<user.vim_normal_counted_command>:
    insert("{vim_normal_counted_command}")
<user.vim_motion_verbs_all>:
    insert("{vim_motion_verbs_all}")
<user.vim_normal_counted_action>:
    insert("{vim_normal_counted_action}")


select <user.vim_select_motion>:
    insert("v{vim_select_motion}")

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
remove all tabs: insert(":%s/\t/    /eg\n")

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

# noncounted action verbs 
# not in vim.py because we don't need any special handling
# note not all of them are listed below, because some are grouped more logically above. for instance marks
#Sequence [commentary; motion]

# Tabular
# XXX - finished tabular support
# not just letter
(a line|align) on <user.letter>: ":Tab/{letter}"

# XXX sort into more suitable spot
display current line number: key(ctrl-g)
delete remaining line: key(D)
change remaining line: key(C)
change line: "cc"
duplicate line: "yyp"
swap characters: "xp"
swap words: "dwwP"
swap lines: "ddp"
# XXX - not just letters
replace <user.letter>: "r{letter}"
replace mode: key(R)
overwrite: key(R)
visual: key(v)
select: key(v)
visual line: key(V)
select line: key(V)
visual all: "ggVG"
select all: "ggVG"
visual block: key(ctrl-v)
select block: key(ctrl-v)
scroll top: "zt"
scroll middle: "zz"
scroll botton: "zb"
scroll top reset cursor: "z\n"
scroll middle reset cursor: "z."
scroll botton reset cursor: "z "

# Surround plugin
surround <user.vim_text_objects> with <user.vim_surround_targets>:
    insert("ys{vim_text_objects}{vim_surround_targets}")

[you] surround line with <user.vim_surround_targets>:
    insert("yss{vim_surround_targets}")

[you] surround and indent line with <user.vim_surround_targets>:
    insert("ySS{vim_surround_targets}")

delete surrounding <user.vim_surround_targets>:
    insert("ds{vim_surround_targets}")

change surrounding <user.vim_surround_targets> to <user.vim_surround_targets>:
    insert("cs{vim_surround_targets}{vim_surround_targets}")
