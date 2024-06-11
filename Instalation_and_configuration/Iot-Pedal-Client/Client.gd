extends Node


enum Message{
	id,
	test,
	addEffect,
	removeEffect,
	updateEffect,
	connected
}

var peer = WebSocketMultiplayerPeer.new()
var id = 0

signal update_effect_2(id: Dictionary, key: String, new_value: float)
var selection = ""

@onready var line_edit = $"../PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer/LineEdit"
@onready var option_button = $"../PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/HBoxContainer/OptionButton"

func _ready():
	pass

func _process(delta):
	peer.poll()
	if peer.get_available_packet_count() > 0:
		var packet = peer.get_packet()
		if packet != null:
			var data_string = packet.get_string_from_utf8()
			var data = JSON.parse_string(data_string)
			
			if data.message == Message.id:
				id = data.id
				$"../PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/ClientStatus".text = "Client Status: conectado id: " + str(data.id)
				
				var message = {
					"message" : Message.connected,
					"data" : $"..".effects
				}
				peer.put_packet(JSON.stringify(message).to_utf8_buffer())
				
			if data.message == Message.updateEffect: #atualizar indices para remoção
				update_effect_2.emit(data.data, "index", data.data.get(data.data.keys()[0])["index"])

func connect_to_server(ip):
	peer.create_client(ip)

func _on_start_client_button_down():
	#connect_to_server("ws://192.168.137.79:8915")
	#connect_to_server("ws://192.168.0.49:8915")
	
	if line_edit.text != "":
		connect_to_server("ws://"+line_edit.text+":8915")
	elif selection != "":
		connect_to_server(selection)

func remove_effect(data: Dictionary, effects: Dictionary):
	var message = {
		"message" : Message.removeEffect,
		"data" : data,
		"effects" : effects
	}
	
	peer.put_packet(JSON.stringify(message).to_utf8_buffer())

func add_effect(data: Dictionary):
	var message = {
		"message" : Message.addEffect,
		"data" : data
	}
	
	peer.put_packet(JSON.stringify(message).to_utf8_buffer())

func update_effect(data: Dictionary):
	var message = {
		"message" : Message.updateEffect,
		"data" : data
	}
	
	peer.put_packet(JSON.stringify(message).to_utf8_buffer())

func _on_send_test_packet_button_down():
	var message = {
		"id" : id,
		"message" : Message.test
	}
	peer.put_packet(JSON.stringify(message).to_utf8_buffer())


func _on_option_button_item_selected(index):
	selection = option_button.get_item_text(index)


func _on_disconnect_button_down():
	peer.close()
	$"../PanelContainer/MarginContainer/ScrollContainer/VBoxContainer/ClientStatus".text = "Client Status: desconectado id: "
