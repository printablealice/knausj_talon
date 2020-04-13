-
save: ":w\n"
save and quit: ":wq\n"
quit: ":q\n"
force quit: ":q!\n"
go [to] line <number>:
    key(":")
    key("{number}")
    key(enter)

# buffering
buffer list: ":ls\n"
buffer close: ":bd\n"
buffer open: ":b "

# vim windowing
split right:
    key(ctrl-w)
    key("l")
split left:
    key(ctrl-w)
    key("h")
split up:
    key(ctrl-w)
    key("k")
split down:
    key(ctrl-w)
    key("j")

highlight off: insert(":nohl")
