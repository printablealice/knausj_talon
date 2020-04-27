os: linux
app: /term/
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
task <user.number_mixed> edit$: "task {number_mixed} edit"

# task completion
task <user.number_mixed> done$: "task {number_mixed} done"
task <user.number_mixed> delete$: "task {number_mixed} delete"
