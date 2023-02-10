class_name SaveSlotTemplate
extends HBoxContainer

signal overwrite_save_file(save_file)
signal load_save_file(save_file)

var save_file : String setget set_save_file_path, get_save_file_path

onready var save_name = $VBoxContainer/SaveName
onready var date = $VBoxContainer/Date
onready var status = $VBoxContainer/Status


func _init(save_file_path : String) -> void:
	self.save_file = save_file_path
	
	var file = File.new()
	if file.file_exists(self.save_file):
		file.close()
		var error = file.open(self.save_file, File.READ)
		if error == OK:
			status.text = "File still valid"
			date.text = OS.get_datetime_from_unix_time(file.get_modified_time(self.save_file))
		else:
			status.text = "Save file has been corrupted"


func set_save_file_path(save_file_path : String) -> void:
	self.save_file = save_file_path
	

func get_save_file_path() -> String:
	return save_file
	

func _on_Overwrite_pressed():
	emit_signal("overwrite_save_file", self.save_file)


func _on_Load_pressed():
	emit_signal("load_save_file", self.save_file)
	
