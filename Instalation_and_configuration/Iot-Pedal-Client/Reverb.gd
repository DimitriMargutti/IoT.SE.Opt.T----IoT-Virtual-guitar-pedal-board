extends PanelContainer

var info:Dictionary = {
	"type" : "reverb",
	"room_size": 0.8,
	"damping" : 0.5,
	"spread" : 1,
	"hipass" : 0,
	"dry" : 1,
	"wet" : 0.5,
	"index" : 0,
	"active" : true
}
var id = {}

signal remove_effect(id: Dictionary)
signal update_effect(id: Dictionary, key: String, new_value: float)

@onready var room_size = $VBoxContainer/GridContainer/RoomSize2
@onready var room_size_value = $VBoxContainer/GridContainer/Value

@onready var dampling = $VBoxContainer/GridContainer/Dampling2
@onready var dampling_value = $VBoxContainer/GridContainer/Value2

@onready var spread = $VBoxContainer/GridContainer/Spread2
@onready var spread_value = $VBoxContainer/GridContainer/Value3

@onready var hipass = $VBoxContainer/GridContainer/HighPass2
@onready var hipass_value = $VBoxContainer/GridContainer/Value4

@onready var dry = $VBoxContainer/GridContainer/Dry2
@onready var dry_value = $VBoxContainer/GridContainer/Value5

@onready var wet = $VBoxContainer/GridContainer/Wet2
@onready var wet_value = $VBoxContainer/GridContainer/Value6


# Called when the node enters the scene tree for the first time.
func _ready():
	room_size.value = info.room_size
	room_size_value.text = str(room_size.value)
	
	wet.value = info.wet
	dry.value = info.dry
	hipass.value = info.hipass
	spread.value = info.spread
	dampling.value = info.wet
	
	wet_value.text = str(info.wet)
	dry_value.text = str(info.dry)
	hipass_value.text = str(info.hipass)
	spread_value.text = str(info.spread)
	dampling_value.text = str(info.wet)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_remove_button_down():
	remove_effect.emit(id)
	queue_free()


func _on_room_size_2_value_changed(value):
	room_size_value.text = str(value)
	update_effect.emit(id,"room_size",value)


func _on_wet_2_value_changed(value):
	wet_value.text = str(value)
	update_effect.emit(id,"wet",value)


func _on_dry_2_value_changed(value):
	dry_value.text = str(value)
	update_effect.emit(id,"dry",value)


func _on_high_pass_2_value_changed(value):
	hipass_value.text = str(value)
	update_effect.emit(id,"hipass",value)


func _on_spread_2_value_changed(value):
	spread_value.text = str(value)
	update_effect.emit(id,"spread",value)


func _on_dampling_2_value_changed(value):
	dampling_value.text = str(value)
	update_effect.emit(id,"dampling",value)


func _on_check_button_toggled(toggled_on):
	update_effect.emit(id, "active", toggled_on)
