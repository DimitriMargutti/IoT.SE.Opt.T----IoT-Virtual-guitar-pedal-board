extends Control

var select = preload("res://SelectEffect.tscn")
var reverb = preload("res://Reverb.tscn")
var distortion = preload("res://Distortion.tscn")
var delay = preload("res://Delay.tscn")
var chorus = preload("res://Chorus.tscn")
var pitch_shift = preload("res://PitchShift.tscn")

@onready var vertical_container = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer
@onready var add_button = $PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/AddEffect
@onready var client = $Client

signal add_effect(id: Dictionary)

var index = 0
var effects = {"index": index}

# Called when the node enters the scene tree for the first time.
func _ready():
	add_effect.connect(on_add_effect)
	client.connect("update_effect_2", on_update_effect)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_add_effect_button_down():
	var selector = select.instantiate()
	add_child(selector)
	selector.connect("selection", on_selection)

func on_selection(selected):
	var effect = null
	match selected:
		"reverb":
			effect = reverb.instantiate()
		"distortion":
			effect = distortion.instantiate()
		"delay":
			effect = delay.instantiate()
		"chorus":
			effect = chorus.instantiate()
		"pitch_shift":
			effect = pitch_shift.instantiate()
	
	if effect != null:
		vertical_container.add_child(effect)
		vertical_container.move_child(add_button, -1)
				
		effect.connect("remove_effect", on_remove_effect)
		effect.connect("update_effect", on_update_effect)
				
		var template = {str(index): effect.info}
				
		effect.id = template
		add_effect.emit(template)
		index +=1
		effects["index"] = index

func on_add_effect(id: Dictionary):
	var i = id.keys()[0]
	effects.merge(id)
	print("add: ", effects)
	client.add_effect(id)

func on_remove_effect(id: Dictionary):
	var i = id.keys()[0]
	client.remove_effect(id, effects)
	effects.erase(i)
	print("remove: ", effects)

func on_update_effect(id: Dictionary, key: String, new_value: float):
	var i = id.keys()[0]
	var dict:Dictionary = effects.get(i)
	dict[key] = new_value
	print("update: ", effects)
	
	var template = {str(i): dict}
	
	client.update_effect(template)
