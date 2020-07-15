mode: user.c
mode: command
and code.language: c
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
settings():
    # whether or not to use uint_8 style datatypes
    user.use_stdint_datatypes = 1

action(user.code_operator_indirection): "*"
action(user.code_operator_address_of): "&"
action(user.code_operator_structure_deference): "->"
action(user.code_operator_lambda): "=>"
action(user.code_operator_subscript):
    insert("[]")
    key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
#action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " && "
action(user.code_operator_or): " || "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exlcusive_or): " ^ "
action(user.code_operator_bitwise_exlcusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_null): "NULL"
action(user.code_is_null): " == NULL "
action(user.code_is_not_null): " != NULL"
action(user.code_state_if):
    insert("else if() {{\n}}\n")
    key(up left:3)
action(user.code_state_else_if):
    insert("else if() {{\n}}\n")
    key(up left:3)
action(user.code_state_else):
    insert("else\n{{\n}}\n")
    key(up )
action(user.code_state_switch):
    insert("switch()")
    edit.left()
action(user.code_state_case):
    insert("case \nbreak;")
    edit.up()
action(user.code_state_for): "for "
action(user.code_state_go_to): "goto "
action(user.code_state_while):
    insert("while()")
    edit.left()
action(user.code_state_return): "return "

###
# old
###

#directives
direct include:
    insert("#include <>")
    edit.left()
direct define: "#define "
direct undefine: "#undef "
direct if define: "#ifdef "
direct if: "#if "
direct error: "#error "
direct else if: "#elif "
direct end: "#endif "
direct pragma: "#pragma "
state comment: "//"
block comment:
    insert("/*")
    key(enter)
    key(enter)
    insert("*/")
    edit.up()
#control flow
#best used with a push like command
#the below example may not work in editors that automatically add the closing bracket
#if so uncomment the two lines and comment out the rest accordingly
push brackets:
    edit.line_end()
    #insert("{")
    #key(enter)
    insert("{}")
    edit.left()
    key(enter)
    key(enter)
    edit.up()
push semi:
    edit.line_end()
    insert(";")
    key(enter)

#space after parens for placement of brackets
#state if:
#    insert("if () ")
#    edit.left()
#    edit.left()
#state else:
#    insert("else ")
#state elsif:
#    insert("else if () ")
#    edit.left()
#    edit.left()
#state switch:
#    insert("switch () ")
#    edit.left()
#    edit.left()
#state case <number>:
#    insert("case {number}:")
#    key(enter)
#state default:
#    insert("default:")
#    key(enter)
#state break:
#    insert("break;")
#    key(enter)
#state continue:
#    insert("continue;")
#    key(enter)
#state for:
#    insert("for () ")
#    edit.left()
#    edit.left()
#state while:
#    insert("while () ")
#    edit.left()
#    edit.left()
#state do: "do "
#state return: "return "

# Declare variables or structs etc.
# Ex. * int myList
<user.variable> <phrase>:
    insert("{variable} ")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))

<user.variable> <user.letter>:
    insert("{variable} {letter} ")

# Ex. int * testFunction
fun <user.function> <phrase>:
    insert("{function} ")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))
    insert("()")
    edit.left()

<user.function>:
    insert("{function} ")

# Ex. (int *)
cast to <user.cast>: "{cast}"
<user.c_types>: "{c_types}"
<user.c_pointers>: "{c_pointers}"
<user.c_signed>: "{c_signed}"
#import standard libraries
include <user.library>:
    insert("#include <{library}>")
    key(enter)
void: "void"
int main:
    insert("int main()")
    edit.left()

null: insert("NULL")

call print: insert("printf();")
