extends Control

@onready var iot_Pedal = AudioCapture.new()
@onready var server = $Server

# Called when the node enters the scene tree for the first time.
var effects: Dictionary = {}

var ip_adress :String


func _ready():
	$ScrollContainer/VBoxContainer/HBoxContainer.add_child(iot_Pedal)
	server.connect("add_effect", on_add_effect)
	server.connect("remove_effect", on_remove_effect)
	server.connect("update_effect", on_update_effect)
	server.connect("connected", on_connected)
	server.connect("disconnected", on_disconect)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _exit_tree():
	pass

func on_add_effect(effect: Dictionary):
	var id:String = effect.keys()[0]
	var type = effect.get(effect.keys()[0]).type
	var properties:Dictionary = effect.get(effect.keys()[0])
	var node = null
	match(type):
		"reverb":
			node = AudioEffectReverb.new()
		"distortion":
			node = AudioEffectDistortion.new()
		"delay":
			node = AudioEffectDelay.new()
		"chorus":
			node = AudioEffectChorus.new()
		"pitch_shift":
			node = AudioEffectPitchShift.new()
			
	if node != null:
		cycle_properties(node, properties)
		AudioServer.add_bus_effect(0, node)
			
		properties.index = AudioServer.get_bus_effect_count(0) - 1
			
		var template = {
			"data" : effect,
			"message" : server.Message.updateEffect
		}
			
		server.send_to_user(template)
			
		template = {str(effect.keys()[0]) : { "node": node, "index" : properties.index}}
		effects.merge(template)
	
	var s:String = ""
	for e in effects:
		s += str({e:effects[e]}) + "\n"
	
	$ScrollContainer/VBoxContainer/Effects.text = s
	pass
func on_remove_effect(effect: Dictionary, client_effects: Dictionary):
	var id:String = effect.keys()[0]
	var client = client_effects
	var index = int(effect.get(id).index)
	
	for key in client.keys():
		if key != "index" and int(index) < int(client.get(key).index):
			client.get(key).index -= 1
			var template = {
				"data" : {key:client.get(key)},
				"message" : server.Message.updateEffect
			}
			
			effects[key].index = client.get(key).index 
			server.send_to_user(template)
	
	AudioServer.remove_bus_effect(0, index)
	effects.erase(id)
	var s:String = ""
	for e in effects:
		s += str({e:effects[e]}) + "\n"
	
	$ScrollContainer/VBoxContainer/Effects.text = s
	
func on_update_effect(effect: Dictionary):
	var id:String = effect.keys()[0]
	var node: AudioEffect = effects[id].node
	var properties:Dictionary = effect.get(effect.keys()[0])
	 
	cycle_properties(node, properties)

func cycle_properties(node:AudioEffect, effect: Dictionary):
	for property in effect:
		if property != "type" and property != "index" and property != "active":
			node.set(property, effect[property])
		if property == "active":
			AudioServer.set_bus_effect_enabled(0, int(effect["index"]), bool(effect[property]))

func on_disconect():
	for e in effects:
		if AudioServer.get_bus_effect_count(0) > 0:
			AudioServer.remove_bus_effect(0, 0)
		
	effects.clear()
	var s:String = ""
	for e in effects:
		s += str({e:effects[e]}) + "\n"
	
	$ScrollContainer/VBoxContainer/Effects.text = s

func on_connected(effect: Dictionary):
	for e in effects:
		if AudioServer.get_bus_effect_count(0) > 0:
			AudioServer.remove_bus_effect(0, 0)
		
	effects.clear()
	var s:String = ""
	for e in effects:
		s += str({e:effects[e]}) + "\n"
	
	$ScrollContainer/VBoxContainer/Effects.text = s
	
	for e in effect:
		if e != "index":
			on_add_effect({e:effect.get(e)})

