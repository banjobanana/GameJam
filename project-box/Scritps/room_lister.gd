extends Node

var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.READ)
var roomlist

func _ready() -> void:
	#print(roomlistfile.get_csv_line())
	roomlist = roomlistfile.get_csv_line()
