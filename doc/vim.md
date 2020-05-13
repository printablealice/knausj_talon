# Using VIM under Talon

This document serves as an instruction manual and quick tutorial for people
wanting to set up running vim under talon.

Most of the testing has been done on Linux, but if you do test this on other
systems and you have positive or negative results you can provide feedback on
the slack channel.

Please note that if you want to have the full vim experience you will have to
make modifications to both the vim config and talon.

# Initial Setup

## Talon Change - The word `yank`

The default Talon alphabet uses `yank` for the letter `y`. This conflicts with
the natural VIM verb, so it is recommended you change the `y` word in
`code/keys.py`. For example you could instead use: `yell`

## Talon Change - The key `end`

The `code/vim.py` script include support for a motion verb called `end`. To the
problem is that talon also supports the ability to simply say the word `end` and
it will trigger pressing the keyboard key `end`.

You currently have two options to deal with this:

1) You can disable the `end` key in talon, however this will negatively impact
other scenarios where you would normally like to be able to press key directly.

2) Use the alternate vim motion verb `end word`. There aren't too many
downside to this approach aside from it being somewhat cumbersome.

## The `generic_editor.talon` commands

The default actions defined in `generic_editor.talon` are too simple for use
with vim. If you run into problems with overlapping commands you can just
rename this file to `generic_editor.talon_` to disable it from loading.

## Detecting VIM running inside terminals from Talon

If you won't use vim from inside of a terminal you can ignore this step.

Normally by default all terminal grammars will be still loaded when VIM is
running in a terminal, because the app itself that talon detects (at least on
Linux) is the terminal. This takes some manual intervention to fix.

The current fix for this is to modify the `~/.vimrc` configuration file, so
that talon is able to differentiate between vim running in the terminal and the
terminal itself. For instance I add `VIM` in the `titlestring` and this allows
me to set the `vim` talon tag by using `win.title: /VIM/`. It also lets me
descriminate terminal vs vim tags in terminal talon files by using
`not win.title: /VIM/`.

To set your titlestring to include `VIM`, use something like the following:

```
let &titlestring ='%t (%f) - VIM'
set title " required for neovim
```

Talon will search the active terminal window title and look for `VIM`, at which
point it will correctly trigger the vim tag and disable the terminal tag.

## Detecting current vim mode

The longer term plan is for talon to be able to intelligently determine the
mode that vim is currently running in, and automatically switch to different
modes depending on the commands that are issue. In theory you could do this
using RPC, but vim and neo vim both use a different method so for now we
simply rely on advertising it in the `titlestring`, similar to solving the
previous problem.

```
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'N·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '^V' : 'V-Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \}
let &titlestring ='%t (%f) - VIM MODE:%{mode()}'
set title
```

## Using VIM as your terminal

Recent versions of vim and neovim both allow you to run a terminal emulator
inside of a vim buffer itself. For people that are using voice to control their
systems this is actually very useful it allows you to navigate the terminal
history using vim motions. This allows you to for an instance copy in paste
lines they were printed from different terminal commandswould otherwise require
you to use a mouse to highlight, copy, and paste. its alternatively you might
be tempted to use a terminal that supports of thim like selection mode similar
to termite, however the selection mode has serious drawbacks such as no line
numbers, limited motion verbs, etc.

If you choose to use them as your terminal than you have to make certain
modifcations again to the talon configuration files, and the vim configuration
in order for it to differentiate between terminal mode and wiimote

First you'll have to ensure that the vim mode is correctly advertised in your
title string, similar to the previous section. The following example can be
placed into your vim config file.

```
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'N·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '^V' : 'V-Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \}
let &titlestring ='%t (%f) - VIM MODE:%{mode()}'
set title
```

The `vim_terminal.talon` files should be able to match based off of the titles
string above, in which case it will trigger terminal mode despite being inside
of vim.

NOTE: There seems to be a bug where neovim does not properly advertise the
mode being in terminal mode, or it's not actually possible to do this matching
yet.

## Automatically switching neovim using RPC

Once again we can rely on the `titlestring` to tell talon where to look to
access the current neovim instances' RPC Unix Domain Socket (UDS).

```
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'N·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '^V' : 'V-Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \}
let &titlestring ='%t (%f) - VIM MODE:%{mode()} RPC:%{v:servername}'
set title
```

With this enable talon is able to directly modify the mode of the current
neovim window over RPC.

### Installing neovim python package

XXX - this isn't done/documented yet

# Supported VIM Features

* motions
* settings
* registers
* macros
* folding
* tabs
* splits
* plugins

# VIM Plugins

Right now plugins are sorted into their own section under
`apps/linux/vim_plugins`. The below is a quick summary of the more heavily
tested plugins.

## fugitive.vim

`vim_plugins/fugitive.talon`

## vim-plug.vim
`vim_plugins/plug.talon`

## fzf.vim
`vim_plugins/fzf.talon`

## nerdtree.vim
`vim_plugins/nerdtree.talon`

## cscope.vim
`vim_plugins/cscope.talon`

## ale.vim
`vim_plugins/ale.talon`

## surround.vim
`vim_plugins/surround.talon`

# Miscellaneous Recommendations

Use ultisnips and vim-snippets to speed up your development and vim voice usage
in general.

XXX - provide examples of why this is useful

# VIM Examples and Tutorial

This section provides an interactive section where you can test certain
commands and get a feel for how to interact with the VIM plugins.

It also recommended that you check out the youtube videos related to vimspeak
since it is the original projected this was ported from. You could try to
follow along with his demos as most of the command should be supported.

* [vimspeak code demo](https://www.youtube.com/watch?v=TEBMlXRjhZY)
* [vimspeak vim golf demo](https://www.youtube.com/watch?v=qy84TYvXJbk)

## Simple motions and edits

Here you can try out some basic commands to get a feel for the flow of using
the VIM voice commands. Most of the commands should be fairly intuitive.

```
The fox slow jumps under the lazy brown dog.
```

With the cursor starting on the letter `T` above, try practicing with the
following commands:

* `normal mode`
* `set line numbers`
* `scroll middle`
* `end of line`
* `start of line`
* `word`
* `two word`
* `find run`
* `append`
* `say and under`
* `normal mode`
* `find reversed air`
* `inject space`
* `back`
* `two delete word`
* `find reversed quench`
* `change word`
* `say slow`
* `back`
* `swap words`
* `two back`
* `replace bat`

### Intermediate Usage

Now we will experiment with some more complicated edits
XXX - to do

### Advanced Usage

XXX - to do

# Frequently Asked Questions

## Why not just use keyboard commands

Some people would suggest that a better approach is to use explicit keyboard
shortcuts and talon alphabet to use VIM, and not break out all of the commands
into distinct grammars. If you feel this is better, simply don't use any of the
provided commands. I chose to do it this way as it feels more natural when
using voice.
