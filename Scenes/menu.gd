extends TileMap

signal start_pressed
signal exit_pressed

var current_choice: int = 0
const ARROW_COORD := Vector2i(1, 3)
const source_id := 2 

@onready var fg_tilemap: TileMapLayer = $Fg

const OPTION_POSITIONS = [
	Vector2i(19, 7),
	Vector2i(19, 9),
	Vector2i(19, 11)
]

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	update_arrow_display()

func _input(_event: InputEvent) -> void:
	if not visible: 
		return

	if Input.is_action_just_pressed("ui_up"):
		current_choice = posmod(current_choice - 1, 3)
		update_arrow_display()
	
	elif Input.is_action_just_pressed("ui_down"):
		current_choice = posmod(current_choice + 1, 3)
		update_arrow_display()
	
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection()

func update_arrow_display() -> void:
	for pos in OPTION_POSITIONS:
		fg_tilemap.erase_cell(pos)
	
	fg_tilemap.set_cell(OPTION_POSITIONS[current_choice], source_id, ARROW_COORD)

func handle_selection() -> void:
	match current_choice:
		0: _on_start_selected()
		1: _on_check_selected()
		2: _on_exit_selected()


func _on_start_selected() -> void:
	hide()
	start_pressed.emit()

func _on_check_selected() -> void:
	print("Check handled by you!") 

func _on_exit_selected() -> void:
	exit_pressed.emit()
	get_tree().quit()
