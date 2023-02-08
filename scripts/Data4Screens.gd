extends MarginContainer


onready var name_textbox = $VBoxContainer2/VBoxContainer/HBoxContainer/Name
onready var slide = $VBoxContainer2/VBoxContainer/HBoxContainer2/Slide
onready var number = $VBoxContainer2/VBoxContainer/HBoxContainer3/Number
onready var input = $VBoxContainer2/VBoxContainer/HBoxContainer4/Input

var default_data = {
	
}

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Reset_pressed():
	pass # Replace with function body.


func _on_Clear_pressed():
	name_textbox.text = ""
	slide.value = 0
	number.value = 0
	
	InputMap.action_erase_events("ui_up")
	var new_event = InputEventKey.new()
	new_event.set_scancode(KEY_UP)
	InputMap.action_add_event("ui_up",new_event)
	
	input.display_current_key()
