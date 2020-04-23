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
edit eye three config: "vim ~/.i3/config\n"
jump to work: "cd ~/src/edg/ && ls\n"
talon source: "cd  ~/src/talon\n"
