mode: user.personal_info
-
hide: user.personal_info_hide()
(pick | sell | cell) <number_small>:
    result = user.personal_info_select(number_small)
    insert(result)
    user.personal_info_hide()

