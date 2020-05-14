tag: vim
code.language: python
-
###
# Public snippets - part of vim-snippets
###

(snip|snippet) header:
    insert("#!")
    key(tab)

(snip|snippet) if main:
    insert("ifmain")
    key(tab)

(snip|snippet) for loop:
    insert("for")
    key(tab)

(snip|snippet) (dark|dock) string class:
    insert("class")
    key(tab)

(snip|snippet) (dark|dock) string function:
    insert("def")
    key(tab)

(snip|snippet) (dark|dock) string method$:
    insert("defc")
    key(tab)

(snip|snippet) (dark|dock) string static method$:
    insert("defs")
    key(tab)

(snip|snippet) from import:
    insert("from")
    key(tab)

(snip|snippet) if:
    insert("if")
    key(tab)

(snip|snippet) if else$:
    insert("ife")
    key(tab)

(snip|snippet) if if else$:
    insert("ifee")
    key(tab)

(snip|snippet) try:
    insert("try")
    key(tab)

(snip|snippet) if if else$:
    insert("ifee")
    key(tab)

###
# Private snippets
#
# Place your private snippets here that other Talon users won't be able to
# use
###

(snip|snippet) print success:
    insert("psuccess")
    key(tab)

(snip|snippet) print fail:
    insert("pfail")
    key(tab)
