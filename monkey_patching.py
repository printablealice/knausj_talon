import os

from talon import app, ui


def monkey_notify(body="", title="", subtitle="", *kwargs):
    os.system('notify-send.sh -t 3000 -f -u low "%s"' % subtitle)


def monkey_focus(self, *kwargs):
    os.system("i3-msg '[class=\"(?)%s\"] focus'" % self.name)


app.notify = monkey_notify
ui.App.focus = monkey_focus
