#Note: Appending $ will anchor the command
#provide both anchored and unachored commands via 'over'
(say | speak | phrase) <user.text>$:
  result = user.formatted_text(text, "NOOP")
  insert(result)
(say | speak | phrase) <user.text> over:
  result = user.formatted_text(text, "NOOP")
  insert(result)
<user.format_text>$: insert(format_text)
<user.format_text> over: insert(format_text)
# word conflicts with vim.py
#word <user.word>: insert(user.word)
poke <user.word>: insert(user.word)
list formatters: user.list_formatters()
hide formatters: user.hide_formatters()
^nope that$: user.clear_last_phrase()
format help: user.formatters_help_toggle()
format recent: user.formatters_recent_toggle()
format repeat <number>:
  result = user.formatters_recent_select(number)
  insert(result)
format copy <number>:
  result = user.formatters_recent_select(number)
  clip.set_text(result)
^nope that$: user.formatters_clear_last()
^nope that was <user.formatters>$:
  user.formatters_clear_last()
  insert(user.formatters_reformat_last(user.formatters))
