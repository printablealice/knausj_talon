win.title: /VIM MODE:t/
-
tag(): terminal

(shimmy|pop terminal|vim mode):
    key(ctrl-\ ctrl-n)

shimmy up:
    key(ctrl-\ ctrl-n ctrl-b)

# this causes exclusive terminal windows to exit without requiring key press or
# dropping to a new empty buffer
exit terminal:
    key(ctrl-\)
    key(ctrl-n)
    insert("ZQ")
