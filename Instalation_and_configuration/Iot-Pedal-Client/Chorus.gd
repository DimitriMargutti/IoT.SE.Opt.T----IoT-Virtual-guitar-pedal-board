extends PanelContainer

var info:Dictionary = {
	"type" : "chorus",
	"dry": 1.0,
	"wet" : 0.5,
	"voice/1/cutoff_hz" :  8000.0,
	"voice/1/delay_ms" :  15.0,
	"voice/1/depth_ms" :  2.0,
	"voice/1/level_db" : 0.0,
	"voice/1/pan" : -0.5,
	"voice/1/rate_hz" : 0.8,
	"voice/2/cutoff_hz" :  8000.0,
	"voice/2/delay_ms" :   20.0,
	"voice/2/depth_ms" :  3.0,
	"voice/2/level_db" : 0.0,
	"voice/2/pan" : 0.5,
	"voice/2/rate_hz" : 1.2,
	"index" : 0,
	"active" : true

}
var id = {}

@onready var dry = $VBoxContainer/GridContainer/Prop11
@onready var dry_value = $VBoxContainer/GridContainer/Prop111

@onready var wet = $VBoxContainer/GridContainer/Prop1515
@onready var wet_value = $VBoxContainer/GridContainer/Prop151515

@onready var voice_1_cutoff_hz = $VBoxContainer/GridContainer/Prop66
@onready var voice_1_delay_ms = $VBoxContainer/GridContainer/Prop22
@onready var voice_1_depth_ms = $VBoxContainer/GridContainer/Prop44
@onready var voice_1_level_db = $VBoxContainer/GridContainer/Prop55
@onready var voice_1_pan = $VBoxContainer/GridContainer/Prop77
@onready var voice_1_rate_hz = $VBoxContainer/GridContainer/Prop33

@onready var voice_2_cutoff_hz = $VBoxContainer/GridContainer/Prop1313
@onready var voice_2_delay_ms = $VBoxContainer/GridContainer/Prop88
@onready var voice_2_depth_ms = $VBoxContainer/GridContainer/Prop1010
@onready var voice_2_level_db = $VBoxContainer/GridContainer/Prop1212
@onready var voice_2_pan = $VBoxContainer/GridContainer/Prop1414
@onready var voice_2_rate_hz = $VBoxContainer/GridContainer/Prop99

@onready var voice_1_delay_ms_value = $VBoxContainer/GridContainer/Prop222
@onready var voice_1_depth_ms_value = $VBoxContainer/GridContainer/Prop444
@onready var voice_1_level_db_value = $VBoxContainer/GridContainer/Prop555
@onready var voice_1_pan_value = $VBoxContainer/GridContainer/Prop777
@onready var voice_1_rate_hz_value = $VBoxContainer/GridContainer/Prop333

@onready var voice_2_delay_ms_value = $VBoxContainer/GridContainer/Prop888
@onready var voice_2_depth_ms_value = $VBoxContainer/GridContainer/Prop101010
@onready var voice_2_level_db_value = $VBoxContainer/GridContainer/Prop121212
@onready var voice_2_pan_value = $VBoxContainer/GridContainer/Prop141414
@onready var voice_2_rate_hz_value = $VBoxContainer/GridContainer/Prop999


signal remove_effect(id: Dictionary)
signal update_effect(id: Dictionary, key: String, new_value: float)



# Called when the node enters the scene tree for the first time.
func _ready():
	dry_value.text = str(info["dry"])
	wet_value.text = str(info["wet"])
	
	voice_1_delay_ms_value.text =str(info["voice/1/delay_ms"])
	voice_1_depth_ms_value.text = str(info["voice/1/depth_ms"])
	voice_1_level_db_value.text = str(info["voice/1/level_db"])
	voice_1_pan_value.text = str(info["voice/1/pan"])
	voice_1_rate_hz_value.text = str(info["voice/1/rate_hz"])
	
	voice_2_delay_ms_value.text = str(info["voice/2/delay_ms"])
	voice_2_depth_ms_value.text = str(info["voice/2/depth_ms"])
	voice_2_level_db_value.text = str(info["voice/2/level_db"])
	voice_2_pan_value.text = str(info["voice/2/pan"])
	voice_2_rate_hz_value.text = str(info["voice/2/rate_hz"])
	
	dry.value = info["dry"]
	wet.value = info["wet"]

	voice_1_delay_ms.value = info["voice/1/delay_ms"]
	voice_1_depth_ms.value = info["voice/1/depth_ms"]
	voice_1_level_db.value = info["voice/1/level_db"]
	voice_1_pan.value = info["voice/1/pan"]
	voice_1_rate_hz.value = info["voice/1/rate_hz"]
	
	voice_2_delay_ms.value= info["voice/2/delay_ms"]
	voice_2_depth_ms.value = info["voice/2/depth_ms"]
	voice_2_level_db.value = info["voice/2/level_db"]
	voice_2_pan.value = info["voice/2/pan"]
	voice_2_rate_hz.value = info["voice/2/rate_hz"]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_prop_1414_value_changed(value):
	voice_2_pan_value.text = str(value)
	update_effect.emit(id,"voice/1/pan",value)


func _on_prop_1313_value_changed(value):
	update_effect.emit(id,"voice/2/cutoff_hz",value)


func _on_prop_1212_value_changed(value):
	voice_2_level_db_value.text = str(value)
	update_effect.emit(id,"voice/2/level_db",value)


func _on_prop_1010_toggled(toggled_on):
	update_effect.emit(id, "feedback_active", toggled_on)


func _on_prop_99_value_changed(value):
	voice_2_rate_hz_value.text = str(value)
	update_effect.emit(id,"voice/2/rate_hz",value)


func _on_prop_88_value_changed(value):
	voice_2_delay_ms_value.text = str(value)
	update_effect.emit(id,"voice/2/delay_ms",value)


func _on_prop_77_value_changed(value):
	voice_1_pan_value.text = str(value)
	update_effect.emit(id,"voice/1/pan",value)



func _on_prop_55_value_changed(value):
	voice_1_level_db_value.text = str(value)
	update_effect.emit(id,"voice/1/level_db",value)


func _on_prop_44_value_changed(value):
	voice_1_depth_ms_value.text = str(value)
	update_effect.emit(id,"voice/1/depth_ms",value)


func _on_prop_33_value_changed(value):
	voice_1_rate_hz_value.text = str(value)
	update_effect.emit(id,"voice/1/rate_hz",value)


func _on_prop_11_value_changed(value):
	dry_value.text = str(value)
	update_effect.emit(id,"dry",value)


func _on_remove_button_down():
	remove_effect.emit(id)
	queue_free()


func _on_check_button_toggled(toggled_on):
	update_effect.emit(id, "active", toggled_on)


func _on_prop_1515_value_changed(value):
	wet_value.text = str(value)
	update_effect.emit(id,"wet",value)


func _on_prop_22_value_changed(value):
	voice_1_delay_ms_value.text = str(value)
	update_effect.emit(id,"voice/1/delay_ms",value)


func _on_prop_1010_value_changed(value):
	voice_2_depth_ms_value.text = str(value)
	update_effect.emit(id,"voice/2/depth_ms",value)


func _on_prop_66_value_changed(value):
	update_effect.emit(id,"voice/1/cutoff_hz",value)

