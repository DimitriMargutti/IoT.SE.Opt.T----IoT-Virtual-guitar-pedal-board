extends RefCounted
class_name Lobby

var hostID:int
var users:Dictionary = {}


func _init(id):
	hostID = id
	
func add_user(id, name):
	users[id] = {
		"name" : name,
		"id" : id,
		"index" : users.size() + 1
	}
	
	return users[id]
