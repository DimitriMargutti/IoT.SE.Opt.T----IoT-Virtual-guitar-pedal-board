extends PanelContainer

enum  FFT_SIZE {FFT_SIZE_256,FFT_SIZE_512,FFT_SIZE_1024 ,FFT_SIZE_2048, FFT_SIZE_4096, FFT_SIZE_MAX}

var info:Dictionary = {
	"type" : "pitch_shift",
	"pitch_scale": 1.0,
	"oversampling" : 4.0,
	"fft_size" : FFT_SIZE.FFT_SIZE_2048,
	"index" : 0,
	"active" : true

}
var id = {}

signal remove_effect(id: Dictionary)
signal update_effect(id: Dictionary, key: String, new_value: float)

@onready var pitch_scale = $VBoxContainer/GridContainer/Prop11
@onready var pitch_scale_value = $VBoxContainer/GridContainer/Prop111

@onready var oversampling = $VBoxContainer/GridContainer/Prop22
@onready var fft_size = $VBoxContainer/GridContainer/Prop33

# Called when the node enters the scene tree for the first time.
func _ready():
	pitch_scale_value.text = str(info["pitch_scale"])
	fft_size.select(info["fft_size"])
	pitch_scale.value = info["pitch_scale"]
	oversampling.value = info["oversampling"]

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_prop_33_item_selected(index):
	update_effect.emit(id,"fft_size",index)


func _on_prop_22_value_changed(value):
	update_effect.emit(id,"oversampling",value)


func _on_prop_11_value_changed(value):
	pitch_scale_value.text = str(value)
	update_effect.emit(id,"pitch_scale",value)


func _on_check_button_toggled(toggled_on):
	update_effect.emit(id, "active", toggled_on)


func _on_remove_button_down():
	remove_effect.emit(id)
	queue_free()
