tag: vim
mode: user.c
mode: command
and code.language: c
-

(snippet|snip) define:
    user.vim_insert_mode("def")
    key(tab)

(snippet|snip) if not define:
    user.vim_insert_mode("#ifndef")
    key(tab)

(snippet|snip) main:
    user.vim_insert_mode("main")
    key(tab)

(snippet|snip) for loop:
    user.vim_insert_mode("for")
    key(tab)

(snippet|snip) for eye loop:
    user.vim_insert_mode("fori")
    key(tab)

(snippet|snip) else if:
    user.vim_insert_mode("eli")
    key(tab)

(snippet|snip) print:
    user.vim_insert_mode("printf")
    key(tab)

(snippet|snip) struct:
    user.vim_insert_mode("st")
    key(tab)

(snippet|snip) function:
    user.vim_insert_mode("fun")
    key(tab)

(snippet|snip) function declaration:
    user.vim_insert_mode("fund")
    key(tab)

(snippet|snip) file header:
    user.vim_insert_mode("head")
    key(tab)

(snippet|snip) function header:
    user.vim_insert_mode("func")
    key(tab)
