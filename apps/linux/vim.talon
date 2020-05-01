# XXX - globalReplace
# XXX - need to add some of the motion verbs to the text objects
# XXX - pipe everything through something that can detect the vim mode

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
edit [file|new]:
    insert(":e ")
reload config:
    insert(":so $MYVIMRC\n")

[(go|jump)] [to] line <user.number_mixed>:
    key(escape)
    key(:)
    insert("{number_mixed}")
    key(enter)

# editing
format line: "=="
# XXX - this doesn't work with numbers below nine, because the nine will
# trigger its own discrete command in the first part of the command will
# trigger the dd below. we probably need to come up with different trigger for
# the one were you specify the line
delete line <user.number_mixed>$: ":{number_mixed}d\n"
delete line <user.number_mixed> through <user.number_mixed>$: ":{number_mixed_1},{number_mixed_2}d\n"
delete line: "dd"
(copy|yank) line <user.number_mixed>$: ":{number_mixed}y\n"
(copy|yank) line <user.number_mixed> through <user.number_mixed>: ":{number_mixed_1},{number_mixed_2}y\n"
(copy|yank) line: "Y"

# paste line
paste line <user.number_mixed> on line <user.number_mixed>$: ":{number_mixed_1}y\n:{number_mixed_2}\np"
paste line <user.number_mixed> through <user.number_mixed>$: ":{number_mixed_1},{number_mixed_2}y\np"
paste line <user.number_mixed>$: ":{number_mixed}y\np"

open [this] link: "gx"
open this file: "gf"
open this file in [split|window]: 
    key(ctrl-w)
    key(f)
open this file in vertical [split|window]: 
    insert(":vertical wincmd f\n")

# buffering
(buffer list|list buffers): ":ls\n"
buffer close <user.number_mixed>: ":bd {number_mixed}"
buffer close current: ":bd\n"
force buffer close current: ":bd!\n"
buffer open: ":b "
buffer left: ":bprev\n"
buffer right: ":bnext\n"
buffer last: ":b#\n"
close buffers: ":bd "
[(go|jump|open)] buffer <user.number_mixed>: ":b {number_mixed}\n"

# vim windowing
split <user.vim_arrow>:
    key("ctrl-w")
    key("{vim_arrow}")
split (only|exclusive):
    key("ctrl-w")
    key("o")
split rotate [right]:
    key(ctrl-w)
    key(r)

## window resizing
split equalize:
    key("ctrl-w")
    key("=")
[new] vertical split: insert(":vsplit\n")
[new] split: insert(":split\n")

## Non-standard helper commands

push [line]:
    key(escape)
    key(A)

push file:
    key(escape)
    insert("Go")

(dup|duplicate) line: "Yp" 

# helpful for fixing typos or bad lexicons that miss a character
inject <user.any> [before]:
    insert("i{any}")
    key(escape)

inject <user.any> after: 
    insert("a{any}")
    key(escape)

highlight off: ":nohl\n"
hide (highlight|hightlights): ":nohl\n"
set highlight search: ":set hls\n"
set no highlight search: ":set nohls\n"
(show|set) line numbers: ":set nu\n"
(hide|set no) line numbers: ":set nonu\n"

action(edit.redo): key(ctrl-r)
undo:
    key(escape)
    key(u)

# tags/symbol
(jump|dive) [to] (symbol|tag): key(ctrl-])
(pop|leave) (symbol|tag): key(ctrl-t)

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
(go|jump) [to] [last] edit: "`."
(go|jump) [to] [last] (cursor|location): "``"

# sessions
make session: "mksession "

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
(shift|indent) right: key(>)
(shift|indent) left: key(<)

# insert mode trips
clear line: key(ctrl-u)

vim help: ":help "

focus line <user.number_mixed>: ":{number_mixed}\nzt"
center line <user.number_mixed>: ":{number_mixed}\nz."
scroll (centre|center):
    key(escape)
    insert("z.")

scroll bottom:
    key(escape)
    insert("zb")

scroll top:
    key(escape)
    insert("zt")
matching: key(%)
scroll up: key(ctrl-y)
scroll down: key(ctrl-e)
page down: key(ctrl-f)
page up: key(ctrl-b)
half page down: key(ctrl-u)
half page up: key(ctrl-d)

visual block: key(ctrl-v)


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

# noncounted action erbs 
# not in vim.py because we don't need any special handling
# note not all of them are listed below, because some are grouped more logically above. for instance marks
#Sequence [commentary; motion]

# Tabular
# XXX - finished tabular support
# not just letter
(a line|align) on <user.letter>: ":Tab/{letter}"

# auto completion
complete: key(ctrl-n)
complete next: key(ctrl-n)
complete previous: key(ctrl-n)

# XXX sort into more suitable spot
display current line number: key(ctrl-g)
delete remaining line: key(D)
change remaining line: key(C)
change line: "cc"
swap characters: "xp"
swap words: "dwwP"
swap lines: "ddp"
replace <user.any>: "r{any}"
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
scroll bottom: "zb"
scroll top reset cursor: "z\n"
scroll middle reset cursor: "z."
scroll bottom reset cursor: "z "

# Surround plugin
# XXX - switch to a separate file with mode
surround <user.vim_text_objects> with <user.vim_surround_targets>:
    insert("ys{vim_text_objects}{vim_surround_targets}")

surround <user.vim_motion_verbs_all> with <user.vim_surround_targets>:
    insert("ys{vim_motion_verbs_all}{vim_surround_targets}")

surround <user.vim_unranged_surround_text_objects> with <user.vim_surround_targets>:
    insert("ys{vim_unranged_surround_text_objects}{vim_surround_targets}")

[you] surround line with <user.vim_surround_targets>:
    insert("yss{vim_surround_targets}")

[you] surround and indent line with <user.vim_surround_targets>:
    insert("ySS{vim_surround_targets}")

(delete|remove) (surrounding|those) <user.vim_surround_targets>:
    insert("ds{vim_surround_targets}")

(change|replace) (surrounding|those) <user.vim_surround_targets> to <user.vim_surround_targets>:
    insert("cs{vim_surround_targets_1}{vim_surround_targets_2}")

# 
[add] gap above: ":pu _\n:'[+1\n"
[add] gap below: ":pu _\n:'[-1\n"

# Terminal mode
(escape|pop) terminal:
    key(ctrl-\)
    key(ctrl-n)

# tabs
[show] tabs: ":tabs\n"
tab close: ":tabclose\n"
tab next: ":tabnext\n"
tab (prev|previous): ":tabprevious\n"
tab first: ":tabfirst\n"
tab last: ":tablast\n"

# folds
fold (lines|line): "fZ"
fold line <user.number_mixed> through <user.number_mixed>$: ":{number_mixed_1},{number_mixed_2}fo\n"
(open fold|fold open): "zo"
(close fold|fold close): "zc"
