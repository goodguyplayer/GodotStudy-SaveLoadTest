extends Control

const SAVE_DIR = "user://saves/slots/"

var save_path = SAVE_DIR + "player_saves_{save_slot}.dat"

onready var save_file = $VBoxContainer/HBoxContainer/Save
onready var load_file = $VBoxContainer/HBoxContainer/Load
onready var status = $VBoxContainer/Status
onready var data = $"../../../../Data"


enum possible_status {NOT_USED, USED}


func _ready():
	save_file.connect("pressed", self, "_on_Save_pressed")
	load_file.connect("pressed", self, "_on_Load_pressed")
	
	save_path = save_path.format({"save_slot" : name})
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	if file.file_exists(save_path):
		file.close()
		var error = file.open(save_path, File.READ)
		if error == OK:
			if file.get_len() > 0:
				status.text = "There's a save file here"
			else:
				status.text = "Fresh save slot"
	else:
		var error = file.open(save_path, File.WRITE)
		if error == OK:
			status.text = "Fresh save slot"
			file.close()


func _on_Save_pressed():
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data.get_current_data())
		status.text = "There's a save file here"
		file.close()


func _on_Load_pressed():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			data.load_new_data(player_data)
			file.close()
