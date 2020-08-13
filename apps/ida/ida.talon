# A lot of this was taken from the fireeye voiceattackprofile, under the
# assumption either people might already be familiar with the commands
# https://fireeye.github.io/IDA_Pro_VoiceAttack_profile/Reference_sheet.html
mode: user.ida
-
tag(): ida
tag(): disassembler
tag(): debugger

##
# Generic disassembler actions
##

# File handling
action(user.disassembler_open_file): 
    key(alt-f)
    sleep(100ms)
    key(down enter)

# Data formatting
action(user.disassembler_make_array): key(shift-8)
action(user.disassembler_make_binary): key(b)
action(user.disassembler_make_character): key(r)
action(user.disassembler_make_code): key(c)
action(user.disassembler_make_data): key(d)
action(user.disassembler_make_decimal): key(h)
action(user.disassembler_make_enum): key(m)
action(user.disassembler_make_hex): key(q)
action(user.disassembler_make_string): key(a)
action(user.disassembler_make_structure_variable): key(alt-q)
action(user.disassembler_make_unicode): key(alt-a)

# Navigation
action(user.disassembler_jump_back): key(escape)
action(user.disassembler_jump_address): key(g)
action(user.disassembler_next_call): key(ctrl-alt-shift-6)
action(user.disassembler_previous_call): key(ctrl-alt-shift-7)
action(user.disassembler_function_start): key(ctrl-alt-shift-1)
action(user.disassembler_function_end): key(ctrl-alt-shift-2)
action(user.disassembler_close_window): key(alt-f3)
toggle graph: key(space)

# Searching
action(user.disassembler_search_bytes): key(alt-b)
action(user.disassembler_search_text): key(alt-t)
action(user.disassembler_search_value): key(alt-i)
action(user.disassembler_next_bytes): key(ctrl-b)
action(user.disassembler_next_code): key(alt-c)
action(user.disassembler_next_data): key(ctrl-d)
action(user.disassembler_next_explored): key(ctrl-a)
action(user.disassembler_next_text): key(ctrl-t)
action(user.disassembler_next_unexplored): key(ctrl-u)
action(user.disassembler_next_value): key(ctrl-i)
action(user.disassembler_next_void): key(ctrl-v)
     
##
# Generic debugger actions
##
action(user.debugger_add_sw_breakpoint): key(f2)

##
# Menu
##
open file menu: key(alt-f)
open edit menu: key(alt-e)
open debugger menu: key(alt-u)
open jump menu: key(alt-j)
open lumina menu: key(alt-n)
open options menu: key(alt-o)
open search menu: key(alt-h)
open view menu: key(alt-v)
open windows menu: key(alt-w)
exit without saving:
    key(alt-x)
    sleep(500ms)
    key(tab down space tab enter)

##
# General options management
##
open general options: user.ida_open_general_options()
toggle (addresses|[line] prefixes):
    user.ida_open_general_options()
    key(alt-p)
    user.accept_change()

toggle opcodes:
    user.ida_open_general_options()
    key(alt-d)
    user.accept_change()


