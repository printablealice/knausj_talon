#Note: Appending $ will anchor the command
#provide both anchored and unachored commands via 'over'
<user.format_text>$: insert(format_text)
<user.format_text> over: insert(format_text)
phrase <phrase>$: dictate.lower(phrase)
phrase <phrase> over: dictate.lower(phrase)
(say | speak) <phrase>$: dictate.lower(phrase)
(say | speak) <phrase> over: dictate.lower(phrase)
word <word>: dictate.lower(word)


