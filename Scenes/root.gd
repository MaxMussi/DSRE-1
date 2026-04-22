extends Node2D

var game_scene := preload("res://Scenes/game.tscn")

func _ready() -> void:
	var game = game_scene.instantiate()
	add_child(game)
