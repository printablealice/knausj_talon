number <number>: insert("{number}")
dragon words: "<dgnwords>"
dragon dictation: "<phrase>"
(shock|slap): key(enter)
#slap:
#	edit.line_end()
#key(enter)
dot pie: ".py"
dot talon: ".talon"
dot mark down: ".md"
dot shell: ".sh"
dot vim: ".vim"
dot see: ".c"
dot com: ".com"
dot net: ".net"
dot org: ".org"
dot exe: ".exe"
dot bin: ".bin"

(jay son | jason ): "json"
(http | htp): "http"
tls: "tls"
M D five: "md5"
string U T F eight:
	insert("'utf8'")

(regex | rejex): "regex"
[pair] (parens|args):
	insert("()")
	key(left)
[pair] (brackets|braces): "{}"
[pair] squares: "[]"
[pair] angles: "<>"

args:
	insert("()")
	key(left)
[inside] (index | array):
	insert("[]")
	key(left)
(dickt in it | inside bracket | in bracket):
	insert("{}")
	key(left)
# XXX - block alone conflicts with vim key words
add code block:
	insert("{}")
	key(left enter enter up tab)
(in | inside) percent:
	insert("%%")
	key(left)

zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_out()
(page | scroll) up: key(pgup)
(page | scroll) down: key(pgdown)
copy that: edit.copy()
cut that: edit.cut()
paste that: edit.paste()
paste match: edit.paste_match_style()
file save: edit.save()
#menu help: key(F1)
#spotlight: key(super)
#(undo that | skunks): edit.undo()
#redo that: edit.redo()
volume up: key(volup)
volume down: key(voldown)
mute: key(mute)
play next: key(next)
play previous: key(prev)
(play | pause): key(play_pause)

local host: "127.0.0.1"
(hex|hexadecimal) [(num|number)] <number>: "0x{number}"
#hex (num|number) <number>: "0x{number}"
hyper:
    edit.copy()
    edit.paste()
sucker:
    edit.copy()
    edit.paste()
    key(enter)
pucker:
    edit.paste()
    key(enter)

web link: "http://"
file link: "file://"
