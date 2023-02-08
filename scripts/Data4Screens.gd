extends MarginContainer


onready var name_textbox = $VBoxContainer2/VBoxContainer/HBoxContainer/Name
onready var slide = $VBoxContainer2/VBoxContainer/HBoxContainer2/Slide
onready var number = $VBoxContainer2/VBoxContainer/HBoxContainer3/Number
onready var input = $VBoxContainer2/VBoxContainer/HBoxContainer4/Input

var input_event = InputEventKey.new()
var input_default = input_event.set_scancode(KEY_UP)

var default_data = {
	"name_textbox" : "",
	"slide" : 0,
	"number" : 0,
	"button_remap" : input_event,
}


func load_new_data(data : Dictionary) -> void:
	name_textbox.text = data["name_textbox"]
	slide.value = data["slide"]
	number.value = data["number"]
	var load_input_event = InputEventKey.new()
	load_input_event.set_scancode(data["button_remap"])
	input.remap_action_to(load_input_event)
	input.display_current_key()
	

func get_current_data() -> Dictionary:
	var data = {
		"name_textbox" : name_textbox.text,
		"slide" : slide.value,
		"number" : number.value,
		"button_remap" : InputMap.get_action_list("ui_up")[0].scancode,
	}
	return data


func _on_Clear_pressed() -> void:
	name_textbox.text = default_data["name_textbox"]
	slide.value = default_data["slide"]
	number.value = default_data["number"]

#	var new_event = InputEventKey.new()
#	new_event.set_scancode(KEY_UP)
#	InputMap.action_add_event("ui_up",new_event)
	input.remap_action_to(default_data["button_remap"])
	input.display_current_key()
