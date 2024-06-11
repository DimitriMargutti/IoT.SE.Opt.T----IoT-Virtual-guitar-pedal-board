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
var client_ids = []

signal add_effect(effect: Dictionary)
signal remove_effect(effect: Dictionary, effects: Dictionary)
signal update_effect(effect: Dictionary)

signal connected(effects: Dictionary)
signal disconnected

# Called when the node enters the scene tree for the first time.
func _ready():
	peer.connect("peer_connected", peer_connected)
	peer.connect("peer_disconnected", peer_disconnected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	peer.poll()
	if peer.get_available_packet_count() > 0:
		var packet = peer.get_packet()
		if packet != null:
			var data_string = packet.get_string_from_utf8()
			var data = JSON.parse_string(data_string)
			
			if data.message == Message.test:
				$"../ScrollContainer/VBoxContainer/ClientStatus".text = "Client Status: conectado id: " + str(data.id) + " test packet received"

			if data.message == Message.addEffect:
				add_effect.emit(data.data)
			if data.message == Message.removeEffect:
				remove_effect.emit(data.data, data.effects)
			if data.message == Message.updateEffect:
				update_effect.emit(data.data)
				
			if data.message == Message.connected:
				connected.emit(data.data)

func peer_connected(id):
	var message = {
		"id" : id,
		"message" : Message.id
	}
	client_ids.append(id)
	
	$"../ScrollContainer/VBoxContainer/ClientStatus".text = "Client Status: conectado id: " + str(id)
	send_to_user(message)
	
func peer_disconnected(id):
	client_ids.pop_at(client_ids.find(id))
	$"../ScrollContainer/VBoxContainer/ClientStatus".text = "Client Status: desconectado id: "
	disconnected.emit()


func send_to_user(data):
	peer.get_peer(client_ids[-1]).put_packet(JSON.stringify(data).to_utf8_buffer())

func start_server():
	peer.create_server(8915)
	$"../ScrollContainer/VBoxContainer/ServerStatus".text = "Server Status: online"

func _on_start_server_button_down():
	start_server()
