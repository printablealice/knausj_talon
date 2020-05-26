#defines the various mode commands
mode: all
-
welcome back:
	user.mouse_wake()
	user.history_enable()
	speech.enable()
sleep all:
	user.switcher_hide_running()
	user.history_disable()
	user.homophones_hide()
	user.help_hide()
	user.mouse_sleep()
	speech.disable()
	user.engine_sleep()
talon sleep:
    speech.disable()
    user.system_command('notify-send.sh -t 3000 -f -u low "Talon Sleep"')
talon wake:
    speech.enable()
    user.system_command('notify-send.sh -t 3000 -f -u low "Talon Awake"')
dragon mode: speech.disable()
talon mode: speech.enable()
^(dictation mode|dictate)$:
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    user.system_command('notify-send.sh -t 3000 -f -u low "Dictation Mode"')
^command mode$:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.enable("command")
    user.system_command('notify-send.sh -t 3000 -f -u low "Command Mode"')
[enable] debug mode:
    mode.enable("user.gdb")
    user.system_command('notify-send.sh -t 3000 -f -u low "Debug Mode Enabled"')
disable debug mode:
    mode.disable("user.gdb")
    user.system_command('notify-send.sh -t 3000 -f -u low "Debug Mode Disabled"')
