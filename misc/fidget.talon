os: linux
-
# Stuff that no one else will ever want/need to use

# special case for fixing vim wrapping when editing outside of vim
hookah: 
    key(end)
    key(delete)
    key(space)
    key(down)

edit (vim|them) config: "vim ~/.vimrc\n"
jump to (vim|them): "cd ~/.vim\n"
edit shell config: "vim ~/.zshrc\n"
jump to shell: "cd ~/.ohmyzsh\n"
edit secure shell config: "vim ~/.ssh/config\n"
edit eye three config: "vim ~/.i3/config\n"
jump to work: "cd ~/src/edg/ && ls\n"
talon source: "cd  ~/src/talon\n"
edit talon lexicon: "vim ~/.talon/w2l/en_US/lexicon.txt && rm ~/.talon/w2l/en_US/lexicon_flat.bin\n"
x him: "exim"
add to do: "# XXX - "
