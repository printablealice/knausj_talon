# XXX - globalReplace
# XXX - need to add some of the motion verbs to the text objects
# XXX - pipe everything through something that can detect the vim mode

os:linux
app:gvim
app:/term/
and win.title:/VIM/
-

tag(): vim

###
# Actions - Talon generic_editor.talon implementation
#
# NOTE: You can disable generic_editor.talon by renaming it, and still fully
# control vim. These are more for people that are used to the official talon
# editor commands that want to trial vim a bit.
#
# If you prefer to work from INSERT mode, you may want to add the ctrl-o key
# prior to most of these
#
# Note that I don't use any of the below, so they have not been thoroughly
# tested and the VISUAL mode selection stuff will almost certainly not work as
# expected.
###
action(edit.find):
    key(/)
action(edit.find_next):
    key(n)
action(edit.word_left):
    key(b)
action(edit.word_right):
    key(w)
action(edit.left):
    #key(ctrl-o)
    key(h)
action(edit.right):
    key(l)
action(edit.up):
    key(k)
action(edit.down):
    key(j)
action(edit.line_start):
    key(^)
action(edit.line_end):
    key($)
action(edit.file_end):
    key(G)
action(edit.file_start):
    "gg"
action(edit.page_down):
    key(ctrl-f)
action(edit.page_up):
    key(ctrl-b)
action(edit.extend_line_end):
    "v$"
action(edit.extend_left):
    "vh"
action(edit.extend_right):
    "vl"
action(edit.extend_line_up):
    "vk"
action(edit.extend_line_down):
    "vj"
action(edit.extend_word_left):
    "vb"
action(edit.extend_word_right):
    "vw"
action(edit.extend_line_start):
    "v^"
action(edit.extend_file_start):
    "vgg"
action(edit.extend_file_end):
    "vG"
action(edit.indent_more):
    ">>"
action(edit.indent_less):
    "<<"
action(edit.delete_line):
    "dd"
action(edit.delete):
    key(x)

###
# File editing
###
# save alone conflicts too much with say
save file:
    key(escape)
    insert(":w\n")
save [file] as:
    key(escape)
    insert(":w ")
save all:
    key(escape)
    insert(":wa\n")
save and (quit|close):
    key(escape)
    insert(":wq\n")
(close|quit) file:
    key(escape)
    insert(":q\n")
force (close|quit):
    key(escape)
    insert(":q!\n")
refresh file:
    key(escape)
    insert(":e!\n")
edit [file|new]:
    insert(":e ")
reload [vim] config:
    insert(":so $MYVIMRC\n")

[(go|jump)] [to] line <number>:
    key(escape)
    key(:)
    insert("{number}")
    key(enter)

list current directory: ":pwd\n"
change buffer directory: ":lcd %:p:h\n"

# editing
format line: "=="
# XXX - this doesn't work with numbers below nine, because the nine will
# trigger its own discrete command in the first part of the command will
# trigger the dd below. we probably need to come up with different trigger for
# the one were you specify the line
delete line <number>$: ":{number}d\n"
delete line <number> through <number>$: ":{number_1},{number_2}d\n"
delete line: "dd"
(copy|yank) line <number>$: ":{number}y\n"
(copy|yank) line <number> through <number>: ":{number_1},{number_2}y\n"
(copy|yank) line: "Y"

# duplicating line
(duplicate|paste) line <number> on line <number>$: ":{number_1}y\n:{number_2}\np"
(duplicate|paste) line <number> through <number>$: ":{number_1},{number_2}y\np"
(duplicate|paste) line <number>$: ":{number}y\np"

open [this] link: "gx"
open this file: "gf"
open this file in [split|window]:
    key(ctrl-w)
    key(f)
open this file in vertical [split|window]:
    insert(":vertical wincmd f\n")

###
# Buffers
###
# (buf|buffer)ing
((buf|buffer) list|list (buf|buffer)s): ":ls\n"
(buf|buffer) (close|delete) <number>: ":bd {number} "
(close|delete) (buf|buffer) <number>: ":bd {number} "
(buf|buffer) close current: ":bd\n"
(delete|close) (current|this) buffer: ":bd\n"
force (buf|buffer) close: ":bd!\n"
(buf|buffer) open: ":b "
(buf|buffer) (first|rewind): ":br\n"
(buf|buffer) (left|prev): ":bprev\n"
(buf|buffer) (right|next): ":bnext\n"
# XXX - conflicts with actual :bl command.. maybe use flip?
(buf|buffer) last: ":b#\n"
close (bufs|buffers): ":bd "
[(go|jump|open)] (buf|buffer) <number>: ":b {number}\n"

###
# Splits and Tabs
###

# Splits
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
split (balance|equalize):
    key("ctrl-w")
    key("=")
[new] vertical split: insert(":vsplit\n")
[new] split: insert(":split\n")

###
# Tabs
###
[show] tabs: ":tabs\n"
tab close: ":tabclose\n"
tab next: ":tabnext\n"
tab (prev|previous): ":tabprevious\n"
tab first: ":tabfirst\n"
tab last: ":tablast\n"

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

###
# Settings
###
highlight off: ":nohl\n"
hide (highlight|hightlights): ":nohl\n"
set highlight search: ":set hls\n"
set no highlight search: ":set nohls\n"
(show|set) line numbers: ":set nu\n"
(hide|set no) line numbers: ":set nonu\n"

redo:
    key(escape)
    key(ctrl-r)
undo:
    key(escape)
    key(u)

# tags/symbol
(jump|dive) [to] (symbol|tag): key(ctrl-])
(pop|leave) (symbol|tag): key(ctrl-t)

###
# Movement
#
# Majority of movement is handled in code/vim.py
###
matching: key(%)

###
# Marks
###
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
(make|save) session: ":mksession "
force (make|save) session: ":mksession! "

# macros and registers
show registers: ":reg\n"
show register <user.letter>: ":reg {letter}\n"
play macro <user.letter>: "@{letter}"
repeat macro: "@@"
record macro <user.letter>: "q{letter}"
stop recording: key(q)
modify [register|macro] <user.letter>:
    ":let @{letter}='"
    key(ctrl-r)
    key(ctrl-r)
    insert("{letter}")
    key(')

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
indent [line] <number> through <number>$: ":{number_1},{number_2}>\n"
(shift|indent) left: key(<)
unindent [line] <number> through <number>$: ":{number_1},{number_2}>\n"

# insert mode tricks
# XXX - need make this have mode-specific properties
clear line: key(ctrl-u)


vim help: ":help "

###
# Scrolling and page position
###
(focus|orient) [on] line <number>: ":{number}\nzt"
center [on] line <number>: ":{number}\nz."
scroll top: "zt"
scroll (center|middle): "zz"
scroll bottom: "zb"
scroll top reset cursor: "z\n"
scroll middle reset cursor: "z."
scroll bottom reset cursor: "z "
scroll up: key(ctrl-y)
scroll down: key(ctrl-e)
page down: key(ctrl-f)
page up: key(ctrl-b)
half [page] down: key(ctrl-d)
half [page] up: key(ctrl-u)

visual mode: key(v)
normal mode: key(escape)
insert mode: key(i)
visual block: key(ctrl-v)


search:
    key(escape)
    insert("/\c")

search sensitive:
    key(escape)
    insert("/\C")

search <phrase>$:
    key(escape)
    insert("/\c{phrase}\n")

search <phrase> sensitive$:
    key(escape)
    insert("/\C{phrase}\n")

search <user.ordinals> <phrase>$:
    key(escape)
    insert("{ordinals}/\c{phrase}\n")

search (reversed|reverse) <phrase>$:
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

spider man:
    user.run_vim_cmd("beep")

# Plugins

# NOTE: These are here rather than nerdtree.talon to allow it to load the
# split buffer, which in turn loads nerdtree.talon when focused. Don't move
# these into nerdtree.talon
nerd tree: insert(":NERDTree\n")
nerd find [current] file: insert(":NERDTreeFind\n")

# Personalized stuff
run as python:
    insert(":w\n")
    insert(":exec '!python' shellescape(@%, 1)\n")

remove trailing white space: insert(":%s/\s\+$//e\n")
remove all tabs: insert(":%s/\t/    /eg\n")

reselect: "gv"
# XXX - This should be a callable function so we can do things like:
#       'swap on this <highlight motion>'
#       'swap between line x, y'
swap (selected|highlighted):
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("s///g")
    key(left)
    key(left)
    key(left)

deleted selected empty lines:
    insert(":")
    # leave time for vim to populate '<,'>
    sleep(50ms)
    insert("g/^$/d\j")

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
replace [ship|upper|upper case] <user.letters>:
    "r"
    user.keys_uppercase_letters(letters)
replace mode: key(R)
overwrite: key(R)
(visual|select|highlight): key(v)
(visual|select|highlight) line: key(V)
(visual|select|highlight) all: "ggVG"
(visual|select|highlight) block: key(ctrl-v)

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

(change|replace|swap) (surrounding|those) <user.vim_surround_targets> (to|with) <user.vim_surround_targets>:
    insert("cs{vim_surround_targets_1}{vim_surround_targets_2}")

# XXX - the gap above doesn't actually work at the moment
[add] gap above: ":pu _\n:'[+1\n"
[add] gap below: ":pu _\n:'[-1\n"

# Terminal mode
(escape|pop) terminal:
    key(ctrl-\)
    key(ctrl-n)

###
# Folding
###
fold (lines|line): "fZ"
fold line <number> through <number>$: ":{number_1},{number_2}fo\n"
(unfold|open fold|fold open): "zo"
(close fold|fold close): "zc"
open all folds: "zR"
close all folds: "zM"


# run commands
run as python: ":!python %\n"
