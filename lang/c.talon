mode: user.c
mode: command
and code.language: c

-
settings():
    # whether or not to use uint_8 style datatypes
    user.use_stdint_datatypes = 1

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
state if:
    insert("if () ")
    edit.left()
    edit.left()
state else:
    insert("else ")
state elsif:
    insert("else if () ")
    edit.left()
    edit.left()
state switch:
    insert("switch () ")
    edit.left()
    edit.left()
state case <number>:
    insert("case {number}:")
    key(enter)
state default:
    insert("default:")
    key(enter)
state break:
    insert("break;")
    key(enter)
state continue:
    insert("continue;")
    key(enter)
state for:
    insert("for () ")
    edit.left()
    edit.left()
state while:
    insert("while () ")
    edit.left()
    edit.left()
state do: "do "
state return: "return "

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
