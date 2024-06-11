extends PanelContainer

var info:Dictionary = {
	"type" : "delay",
	"dry": 1.0,
	"feedback_active" : false,
	"feedback_delay_ms" :  340.0,
	"feedback_level_db" : -6.0,
	"feedback_lowpass" : 16000.0,
	"tap1_active" : true,
	"tap1_delay_ms" : 250.0,
	"tap1_level_db" : -6.0,
	"tap1_pan" : 0.2,
	"tap2_active" : true,
	"tap2_delay_ms" : 500.0,
	"tap2_level_db" : -12.0,
	"tap2_pan" : -0.4,
	"index" : 0,
	"active" : true

}
var id = {}

@onready var dry = $VBoxContainer/GridContainer/Prop11
@onready var dry_value = $VBoxContainer/GridContainer/Prop111

@onready var tap1_active = $VBoxContainer/GridContainer/Prop22
@onready var tap1_delay_ms = $VBoxContainer/GridContainer/Prop33
@onready var tap1_level_db = $VBoxContainer/GridContainer/Prop44
@onready var tap1_level_db_value = $VBoxContainer/GridContainer/Prop444
@onready var tap1_pan = $VBoxContainer/GridContainer/Prop55
@onready var tap1_pan_value = $VBoxContainer/GridContainer/Prop555

@onready var tap2_active = $VBoxContainer/GridContainer/Prop66
@onready var tap2_delay_ms = $VBoxContainer/GridContainer/Prop77
@onready var tap2_level_db = $VBoxContainer/GridContainer/Prop88
@onready var tap2_level_db_value = $VBoxContainer/GridContainer/Prop888
@onready var tap2_pan = $VBoxContainer/GridContainer/Prop99
@onready var tap2_pan_value = $VBoxContainer/GridContainer/Prop999

@onready var feedback_active = $VBoxContainer/GridContainer/Prop1010
@onready var feedback_delay_ms = $VBoxContainer/GridContainer/Prop1212
@onready var feedback_level_db = $VBoxContainer/GridContainer/Prop1313
@onready var feedback_level_db_value = $VBoxContainer/GridContainer/Prop131313
@onready var feedback_lowpass = $VBoxContainer/GridContainer/Prop1414

signal remove_effect(id: Dictionary)
signal update_effect(id: Dictionary, key: String, new_value: float)



# Called when the node enters the scene tree for the first time.
func _ready():
	dry_value.text = str(info["dry"])
	
	tap1_level_db_value.text = str(info["tap1_level_db"])
	tap1_pan_value.text = str(info["tap1_pan"])
	
	tap2_level_db_value.text = str(info["tap2_level_db"])
	tap2_pan_value.text = str(info["tap2_pan"])
	
	feedback_level_db_value.text = str(info["feedback_level_db"])
	
	dry.value = info["dry"]

	tap1_delay_ms.value = info["tap1_delay_ms"]
	tap1_level_db.value = info["tap1_level_db"]
	tap1_pan.value = info["tap1_pan"]

	tap2_delay_ms.value = info["tap2_delay_ms"]
	tap2_level_db.value = info["tap2_level_db"]
	tap2_pan.value = info["tap2_pan"]

	feedback_delay_ms.value = info["feedback_delay_ms"]
	feedback_level_db.value = info["feedback_level_db"]
	feedback_lowpass.value = info["feedback_lowpass"]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_prop_1414_value_changed(value):
	update_effect.emit(id, "feedback_lowpass", value)


func _on_prop_1313_value_changed(value):
	feedback_level_db_value.text = str(value)
	update_effect.emit(id,"feedback_level_db",value)


func _on_prop_1212_value_changed(value):
	update_effect.emit(id, "feedback_delay_ms", value)


func _on_prop_1010_toggled(toggled_on):
	update_effect.emit(id, "feedback_active", toggled_on)


func _on_prop_99_value_changed(value):
	tap2_pan_value.text = str(value)
	update_effect.emit(id,"tap2_pan",value)


func _on_prop_88_value_changed(value):
	tap2_level_db_value.text = str(value)
	update_effect.emit(id,"tap2_level_db",value)


func _on_prop_77_value_changed(value):
	update_effect.emit(id, "tap2_delay_ms", value)


func _on_prop_66_toggled(toggled_on):
	update_effect.emit(id, "tap2_active", toggled_on)


func _on_prop_55_value_changed(value):
	tap1_pan_value.text = str(value)
	update_effect.emit(id,"tap1_pan",value)


func _on_prop_44_value_changed(value):
	tap1_level_db_value.text = str(value)
	update_effect.emit(id,"tap1_level_db",value)


func _on_prop_33_value_changed(value):
	update_effect.emit(id, "tap1_delay_ms", value)


func _on_prop_22_toggled(toggled_on):
	update_effect.emit(id, "tap1_active", toggled_on)


func _on_prop_11_value_changed(value):
	dry_value.text = str(value)
	update_effect.emit(id,"dry",value)


func _on_remove_button_down():
	remove_effect.emit(id)
	queue_free()


func _on_check_button_toggled(toggled_on):
	update_effect.emit(id, "active", toggled_on)
