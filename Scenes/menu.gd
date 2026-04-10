extends TileMap

signal start_game_requested

func _ready():
	start.call_deferred()

func start():
	start_game_requested.emit()
