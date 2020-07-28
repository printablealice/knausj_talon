mode: user.homophones
-
hide: user.homophones_hide()

(pick | sell | cell) <user.homophones_selection>:
    insert(homophones_selection)
    user.homophones_hide()

<user.homophones_formatted_selection>:
    insert(homophones_formatted_selection)
    user.homophones_hide()
