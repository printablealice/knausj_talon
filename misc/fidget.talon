os: linux
-
# Stuff that no one else will ever want/need to use

###
# Convenience
###

dev talon:
    insert("cd ~/.talon/user/fidget\n")
    insert("ls\n")

edit talon wiki:
    insert("cd ~/src/talon_wiki\n")
    insert("ls\n")

talon shell:
    insert("~/.talon/bin/repl\n")
talon base:
    insert("cd ~/.talon/\n")
    insert("ls\n")
talon (python|classes):
    insert("cd ~/source/talon/releases/latest/resources/python/lib/python3.7/site-packages/talon\n")
    insert("ls\n")
talon source: "cd  ~/src/talon\n"

edit (vim|them) config: "vim ~/.vimrc\n"
jump to (vim|them): "cd ~/.vim\n"
edit shell config: "vim ~/.zshrc\n"
resource shell: "source ~/.zshrc"
jump to shell: "cd ~/.ohmyzsh\n"
jump to shell functions: "cd ~/.ohmyzsh/custom/functions/\n"
jump to dotfiles: "cd ~/dotfiles\n"

# config
edit ignore file: "vim .gitignore\n"
(edit|at it) (secure shell| S S H) config: "vim ~/.ssh/config\n"
(edit|at it) (eye three|window manager) config: "vim ~/.i3/config\n"
(edit|at it) window manager config: "vim ~/.i3/config\n"

# snippets
edit custom snippets: "vim ~/.vim/custom-snippets\n"
edit vim snippets:
    "vim ~/.vim/plugged/vim-snippets/UltiSnips/\n"
edit markdown snippets:
    "vim ~/.vim/plugged/vim-snippets/UltiSnips/markdown.snippets\n"
edit python snippets:
    "vim ~/.vim/plugged/vim-snippets/UltiSnips/python.snippets\n"
jump to work: "cd ~/src/edg/ && ls\n"
talon pulls: "cd  ~/src/talon_pull/fidget\n"
new talon pull branch: "new_talon_pull_repo.sh "
public source: "cd  ~/pub/src/\n"
edit talon lexicon: "vim ~/.talon/w2l/en_US/lexicon.txt && rm ~/.talon/w2l/en_US/lexicon_flat.bin\n"
x him: "exim"
add to do: "# XXX - "
edit sue do config: "sudo visudo\n"
edit find results:
    insert("vim $(find . -name \"\")")
    edit.left()
    edit.left()
run talon update: "~/.talon/bin/update\n"

fuzzy vimdiff:
    insert("edit -d $(find . -name \"**\")")
    edit.left()
    edit.left()

pulse restart:
    key(super-enter)
    sleep(1)
    insert("pulseaudio -k && pulseaudio --start\n")
    key(super-shift-q)


###
# Admin
###
(dav mail session):
    user.vim_command_mode(":source ~/.vim/sessions/davmail.session")
(scratch session):
    user.vim_command_mode(":source ~/.vim/sessions/scratch.session")

###
# Work
###

# shell helpers
(go|jump) [to] (current|active) [work] (project|directory):
    insert("source ~/projects/current &&")
    insert(" cd $ACTIVE_PROJECT\n")
(go|jump) [to] alternate [work] (project|directory):
    insert("source ~/projects/alternate &&")
    insert(" cd $ACTIVE_PROJECT\n")
edit [to] (current|active) [work] project: "vim ~/projects/current\n"
edit [to] alternate [work] project: "vim ~/projects/alternate\n"
edge (dur|dir): "cd ~/src/edg\n"
run debug: "./debug.sh\n"
run project:
    insert("run_active_project\n")
build project:
    insert("build_active_project\n")
super kill g d b: "sudo pkill gdb\n"
resource config:
    insert("delete br\ny\n")
    insert("source debug_scripts/4.90.gdb\n")

# windows vm
jump to desktop: "cd /mnt/c/Users/edg/Desktop/\n"

# work auto-commands
(open active work space|load active work session):
    user.system_command("/home/aa/scripts/workflow/work_workspace.sh")

open alternate work space:
    user.system_command("/home/aa/scripts/workflow/work_workspace.sh")

(connect|start) work (tunnel|vpn):
    user.system_command_nb("/home/aa/scripts/connect_work_vpn.sh")
(disconnect|stop) work (tunnel|vpn):
    user.system_command("/home/aa/scripts/disconnect_work_vpn.sh")

###
# Chat
###
smiley: ":)"
sad face: ":("
big smiley: ":D"
jiff smiley: ">\\o "

###
# Insanity
###

# special case for fixing edit wrapping when editing outside of edit
hookah:
    key(end)
    key(delete)
    key(space)
    key(down)

# Deal with the NetworkManager 2FA pop-up when we need to enter/confirm 2FA
# code
prep two auth:
    key(tab)
    key(space)
    key(tab:3)
    key(right)
    key(backspace:6)
    user.system_command("i3-msg 'focus floating'")
    # can now speak the 2FA code

# fix an error related to the layout of vim terminals inside i3
wiggle:
    key(super-f)
    sleep(1)
    key(super-f)

restart debug session:
    key(ctrl-c)
    insert("quit\n")
    sleep(1)
    insert("y\n")
    insert("!!\n\n")
    sleep(2)
    key(ctrl-c)
    insert("ptchunk -h\n")
    insert("heapls\n")

orwell:
    key(super-0)
    sleep(1)
    edit.copy()
    key(super-u)
    sleep(1)
    edit.paste()
    key(enter)

# XXX
reveal:
    key(super-0)
    sleep(1)
    key(ctrl-u)
    key(super-u)
    sleep(1)
    edit.paste()
    key(enter)

##
# i3wm stuff
##

new scratch shell:
    user.system_command_nb("/home/aa/scripts/workflow/scratch_shell.sh")
