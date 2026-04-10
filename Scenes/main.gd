extends Node

@onready var menu = $Menu
@onready var game = $Game

func _ready():
	game.hide()
	game.process_mode = Node.PROCESS_MODE_DISABLED
	menu.show()
	
	menu.start_game_requested.connect(_on_start_game)

func _on_start_game():
	menu.hide()
	menu.process_mode = Node.PROCESS_MODE_DISABLED
	
	game.show()
	game.process_mode = Node.PROCESS_MODE_INHERIT
