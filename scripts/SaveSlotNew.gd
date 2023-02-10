extends HBoxContainer

signal create_new_save(save_name)

onready var save_new_name = $VBoxContainer/TextEdit
onready var save_button = $VBoxContainer/HBoxContainer/Save
#onready var load_button = $VBoxContainer/HBoxContainer/Load
onready var save_name_textedit = $VBoxContainer/TextEdit



# Called when the node enters the scene tree for the first time.
func _ready():
	save_button.connect("pressed", self, "save_data")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func save_data() -> void:
	emit_signal("create_new_save", save_name_textedit.text)
	save_name_textedit.text = "New Save"
