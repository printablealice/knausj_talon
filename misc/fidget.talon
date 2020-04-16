os: linux
-
# Stuff that no one else will ever want/need to use

# special case for fixing vim wrapping when editing outside of vim
hookah: 
    key(end)
    key(delete)
    key(space)
    key(down)
