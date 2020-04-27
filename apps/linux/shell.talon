os: linux
app: /term/
-
(rerun|run) last command: "!!\n\n"
(chuck|cancel) [that]: key("ctrl-c")

# fzf keybindings
search history: key(ctrl-r)
fuzzy (dir|dear|dur): key(alt-c)
fuzzy (dir|dear|dur) <phrase>: 
    key(alt-c)
    insert("{phrase}")

# zsh commands
reload shell config: "source ~/.zshrc"

# zsh autosuggestions plugin
[got|run] [it|that]: key(ctrl-o)
found it: key(ctrl-g)
keep [it]: key(ctrl-f)
