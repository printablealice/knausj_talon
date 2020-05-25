# https://github.com/gcmt/taboo.vim/
tag: vim
-

tab rename: user.vim_normal_mode(":TabooRename ")
tab rename <phrase>: user.vim_normal_mode(":TabooRename {phrase}")
new tab named: user.vim_normal_mode(":TabooOpen ")
new tab named <phrase>: user.vim_normal_mode(":TabooOpen {phrase}")
tab reset: user.vim_normal_mode(":TabooReset\n")
