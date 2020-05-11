os: linux
tag: terminal
not win.title: /VIM/
-

# general
task version: "task --version\n"
task commands: "task commands\n"
task help: "task help\n"

# task list
task list: "task list\n"
task list orphans: "task project: list\n"
task list untagged: "task tags.none: list\n"
task list <phrase>: "task list {phrase}\n"
task list project: "task list project: "
task list project <phrase>: "task list project:{phrase}\n"

# task add
task add: "task add "
task add <phrase>: "task add {phrase}\n"
task undo: "task undo\n"

(tasks|task next): "task next\n"

# task editing
task <number> edit$: "task {number} edit"

# task completion
task <number> done$: "task {number} done"
task <number> delete$: "task {number} delete"
