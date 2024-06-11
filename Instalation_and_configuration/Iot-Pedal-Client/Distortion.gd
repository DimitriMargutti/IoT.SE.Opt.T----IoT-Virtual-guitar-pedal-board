extends PanelContainer


enum  Mode {MODE_CLIP,MODE_LOFI,MODE_OVERDRIVE ,MODE_WAVESHAPE}

var info:Dictionary = {
	"type" : "distortion",
	"mode": Mode.MODE_CLIP,
	"pre_gain" : 0,
	"drive" : 0,
	"keep_hf_hz" :16000,
	"post_gain" : 0,
	"index" : 0,
	"active" : true
}
var id = {}

signal remove_effect(id: Dictionary)
signal update_effect(id: Dictionary, key: String, new_value: float)

@onready var mode = $VBoxContainer/GridContainer/Prop11
@onready var mode_value = $VBoxContainer/GridContainer/Prop111

@onready var pre_gain = $VBoxContainer/GridContainer/Prop22
@onready var pre_gain_value = $VBoxContainer/GridContainer/Prop222

@onready var keep_hf_hz = $VBoxContainer/GridContainer/Prop33
@onready var keep_hf_hz_value = $VBoxContainer/GridContainer/Prop333

@onready var drive = $VBoxContainer/GridContainer/Prop44
@onready var drive_value = $VBoxContainer/GridContainer/Prop444

@onready var post_gain = $VBoxContainer/GridContainer/Prop55
@onready var post_gain_value = $VBoxContainer/GridContainer/Prop555

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	post_gain_value.text = str(info["post_gain"])
	drive_value.text = str(info["drive"])
	pre_gain_value.text = str(info["pre_gain"])
	
	mode.select(info["mode"])
	pre_gain.value = info["pre_gain"]
	keep_hf_hz.value = info["keep_hf_hz"]
	drive.value = info["drive"]
	post_gain.value = info["post_gain"]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_prop_55_value_changed(value):
	post_gain_value.text = str(value)
	update_effect.emit(id,"post_gain",value)


func _on_prop_44_value_changed(value):
	drive_value.text = str(value)
	update_effect.emit(id,"drive",value)


func _on_prop_33_value_changed(value):
	update_effect.emit(id,"keep_hf_hz",value)


func _on_prop_22_value_changed(value):
	pre_gain_value.text = str(value)
	update_effect.emit(id,"pre_gain",value)


func _on_prop_11_item_selected(index):
	update_effect.emit(id, "mode", index)


func _on_remove_button_down():
	remove_effect.emit(id)
	queue_free()


func _on_check_button_toggled(toggled_on):
	update_effect.emit(id, "active", toggled_on)
