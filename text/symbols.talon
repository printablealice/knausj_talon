question [mark]: "?"
(downscore | underscore): "_"
double dash: "--"
#(bracket | brack | left bracket): "{"
#(rbrack | are bracket | right bracket): "}"
triple quote: '"""'
triple tick: "'''"
(dot dot | dotdot): ".."
#ellipses: "…"
ellipses: "..."
(comma and | spamma): ", "
plus: "+"
arrow: "->"
dub arrow: "=>"
new line: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
empty (string|quotes):
    '""'
    key(left)
empty escaped (string|quotes):
    '\\"\\"'
    key(left)
    key(left)
empty ticks:
    "''"
    key(left)
empty escaped ticks:
    "\\'\\'"
    key(left)
    key(left)
