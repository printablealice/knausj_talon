mode: all
-
welcome back: 
	user.mouse_wake()
	user.history_enable()
	speech.enable()	
sleep all: 
	user.history_disable()
	user.homophones_hide()
	user.help_hide()
	user.mouse_sleep()
	speech.disable()
	user.engine_sleep()
talon sleep: 
    speech.disable()
    user.system_command('notify-send "Talon Sleep"')
talon wake: 
    speech.enable()
    user.system_command('notify-send "Talon Awake"')
dragon mode: speech.disable()
talon mode: speech.enable()
^dictation mode$:
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    user.system_command('notify-send "Dictation Mode"')
^command mode$:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.enable("command")
    user.system_command('notify-send "Command Mode"')
