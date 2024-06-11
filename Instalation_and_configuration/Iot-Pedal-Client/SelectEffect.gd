extends Control
class_name SelectEffect

signal selection(selected:String)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("modulate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_return_button_down():
	$AnimationPlayer.play("demodulate")


func _on_delay_button_down():
	selection.emit("delay")
	$AnimationPlayer.play("demodulate")


func _on_overdrive_button_down():
	selection.emit("distortion")
	$AnimationPlayer.play("demodulate")


func _on_reverb_button_down():
	selection.emit("reverb")
	$AnimationPlayer.play("demodulate")

func _on_chorus_button_down():
	selection.emit("chorus")
	$AnimationPlayer.play("demodulate")


func _on_pitch_shift_button_down():
	selection.emit("pitch_shift")
	$AnimationPlayer.play("demodulate")
