extends Node

@onready var tetris_node = $Game
@onready var menu_node = $Menu

func _ready() -> void:
	menu_node.start_pressed.connect(_on_start_game)
	menu_node.exit_pressed.connect(_on_exit_game)

	tetris_node.hide()
	menu_node.show()
	tetris_node.game_running = false

func _on_start_game() -> void:
	tetris_node.show()
	menu_node.hide()
	tetris_node.new_game()

func _on_exit_game() -> void:
	get_tree().quit()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if not menu_node.visible:
			_return_to_menu()
		else:
			_on_start_game()

func _return_to_menu() -> void:
	tetris_node.game_running = false
	menu_node.show()
	tetris_node.hide()
