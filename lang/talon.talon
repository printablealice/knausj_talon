#code.language: talon
-
insert: 
	insert('insert("")')
	edit.left()
	edit.left()
	

key:
	insert('key()')
	edit.left()

control key:
	insert('key(ctrl-)')
	edit.left()

control shift key:
	insert('key(ctrl-shift-)')
	edit.left()

control alt key:
	insert('key(ctrl-alt-)')
	edit.left()

alt key:
	insert('key(alt-)')
	edit.left()

alt shift key:
	insert('key(alt-shift-)')
	edit.left()

action:
	insert("action()")
	edit.left()

os win:
	insert("os: windows")
	
os mac:
	insert("os: mac")
	
os lunix:
	insert("os: linux")
	
app:
	insert("app: ")
	
tags:
	insert("tags: ")

user:
	insert("user.")
	
comment: 
	edit.line_start()
	insert("#")
