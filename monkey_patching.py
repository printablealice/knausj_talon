import os

from talon import app


def monkey_notify(body, title, subtitle, *kwargs):
    # os.system('notify-send.sh -t 3000 -f -u low "Talon Sleep"')
    print(kwargs)
    os.system('notify-send.sh -t 3000 -f -u low "%s"' % subtitle)


app.notify = monkey_notify
