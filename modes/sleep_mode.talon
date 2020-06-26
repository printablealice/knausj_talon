mode: sleep
-
#this exists solely to prevent talon from walking up super easily in sleep mode at the moment with wav2letter
<phrase>:
    skip()
    user.system_command('notify-send.sh -t 3000 -f -u low "Talon Sleeping"')
