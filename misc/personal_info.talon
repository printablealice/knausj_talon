settings():
    # if set and a list has more than one entry autos select the first one
    # otherwise will use a gui selector by default
    user.pii_auto_select_first_entry = 0
-
my <user.personal_info>: user.personal_info(personal_info)
my personal email: user.personal_info("personal-emails")
my work email: user.personal_info("work-emails")
my first name: user.personal_info("first-name")
my last name: user.personal_info("last-name")
my full name:
    user.personal_info("first-name")
    key(space)
    user.personal_info("last-name")
my phone number: user.personal_info("phone-numbers")
my work number: user.personal_info("work-phone-numbers")
my address: user.personal_info("addresses")
my work address: user.personal_info("work-addresses")

work address {number_small}: user.personal_info_select("work-addresses", number_small)
