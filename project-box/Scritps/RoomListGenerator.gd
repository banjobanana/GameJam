extends Node

var t1rooms = ["res://Levels/T1A.tscn","res://Levels/T1B.tscn"]
var t1size=2
var t2rooms = []
var t2size=0
var rng =RandomNumberGenerator.new()

var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.WRITE)
var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.WRITE)
var file = FileAccess.open("user://seed.dat",FileAccess.READ)

var playerProgress=0
var roomlist=[]
var mapValue=20

func _ready() -> void:
	rng.seed = file.get_64()
	while(mapValue>0):
		var tier = rng.randi_range(1,1)
		match tier:
			1:
				var room = rng.randi_range(0,t1size-1)
				#if t1rooms.size()==2:
					#tier=2
				if t1rooms[room] in roomlist:
					continue
				else:
					roomlist.append(t1rooms[room])
					t1rooms.append(room)
					mapValue-=10
			2:
				var room = rng.randi_range(0,t2size)
				#if t2rooms.size()==2:
					#break
				if t2rooms[room] in roomlist:
					continue
				else:
					roomlist.append(t2rooms[room])
					t2rooms.append(room)
					mapValue-=20
	print("Roomlist: ",roomlist)
	#print("Progress in Loader: ",playerProgress)
	#print("Lvel to be: ",roomlist[playerProgress])
	playerProgress=0
	roomlistfile.store_csv_line(roomlist)
	playerprogressfile.store_64(playerProgress)
	get_tree().change_scene_to_file(roomlist[playerProgress])
	

	
