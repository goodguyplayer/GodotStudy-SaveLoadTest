extends Control

const SAVE_DIR = "user://saves/"

var save_path = SAVE_DIR + "player_saves_1.dat"

onready var console_label = $MarginContainer/Panel/VBoxContainer/Visuals/ScrollContainer/ConsoleLabel

var data = {
	"name" : "Template name",
	"movement_speed" : 35,
	"max_health" : 99,
}


func _on_Save_pressed():
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	
	console_write("data saved")


func _on_Load_pressed():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			console_write(player_data)
	
	console_write("data loaded")


func console_write(value):
	console_label.text += str(value) + "\n"
