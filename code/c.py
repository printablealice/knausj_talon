# Python code largely stolen from https://github.com/fidgetingbits/knausj_talon
from talon import Context, Module, actions

mod = Module()
ctx = Context()

ctx.lists["self.c_pointers"] = {
    "pointer": "*",
    "pointer to pointer": "**",
}

common_signs = {
    "signed": "signed",
    "unsigned": "unsigned",
}

stdint_signs = {
    "signed": "",
    "unsigned": "u",
}

ctx.lists["self.c_signed"] = {
    "signed": "signed ",
    "unsigned": "unsigned ",
}

common_types = {
    "static": "static",
    "volatile": "volatile",
    "register": "register",
}

default_types = {
    "character": "char",
    "char": "char",
    "short": "short",
    "long": "long",
    "int": "int",
    "integer": "int",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
}

stdint_types = {
    "character": "int8_t",
    "char": "int8_t",
    "short": "short",
    "long": "long",
    "int": "int",
    "integer": "int",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
}

ctx.lists["self.c_types"] = {
    "character": "char",
    "char": "char",
    "short": "short",
    "long": "long",
    "int": "int",
    "integer": "int",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
}

ctx.lists["self.c_libraries"] = {
    "assert": "assert.h",
    "type": "ctype.h",
    "error": "errno.h",
    "float": "float.h",
    "limits": "limits.h",
    "locale": "locale.h",
    "math": "math.h",
    "set jump": "setjmp.h",
    "signal": "signal.h",
    "arguments": "stdarg.h",
    "definition": "stddef.h",
    "input": "stdio.h",
    "output": "stdio.h",
    "library": "stdlib.h",
    "string": "string.h",
    "time": "time.h",
}

mod.list("c_pointers", desc="Common C pointers")
mod.list("c_signed", desc="Common C datatype signed modifiers")
mod.list("c_types", desc="Common C types")
mod.list("c_libraries", desc="Standard C library")


@mod.capture
def cast(m) -> str:
    "Returns a string"


@mod.capture
def c_pointers(m) -> str:
    "Returns a string"


@mod.capture
def c_signed(m) -> str:
    "Returns a string"


@mod.capture
def c_types(m) -> str:
    "Returns a string"


@mod.capture
def variable(m) -> str:
    "Returns a string"


@mod.capture
def function(m) -> str:
    "Returns a string"


@mod.capture
def library(m) -> str:
    "Returns a string"


@ctx.capture(rule="{self.c_pointers}")
def c_pointers(m) -> str:
    return m.c_pointers


@ctx.capture(rule="{self.c_signed}")
def c_signed(m) -> str:
    return m.c_signed


@ctx.capture(rule="{self.c_types}")
def c_types(m) -> str:
    return m.c_types


@ctx.capture(rule="{self.c_libraries}")
def library(m) -> str:
    return m.c_libraries


# NOTE: we purposely we don't have a space after signed, to faciltate stdint
# style uint8_t constructions
@ctx.capture(rule="[<self.c_signed>]<self.c_types> [<self.c_pointers>+]")
def cast(m) -> str:
    return "(" + " ".join(list(m)) + ")"


@ctx.capture(rule="[<self.c_signed>]<self.c_types>[<self.c_pointers>]")
def variable(m) -> str:
    return " ".join(list(m))


@ctx.capture(rule="[<self.c_signed>]<self.c_types> [<self.c_pointers>]")
def function(m) -> str:
    return " ".join(list(m))
