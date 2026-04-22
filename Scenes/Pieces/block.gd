extends Node2D

const ANIMATIONS := {
	"I" : "I-Shine",
	"O" : "O-Shine",
	"T" : "T-Shine",
	"S" : "S-Shine",
	"Z" : "Z-Shine",
	"J" : "J-Shine",
	"L" : "L-Shine",
}

var piece_type : String

func set_piece_type(type : String) -> void:
	piece_type = type
	sprite()

func sprite() -> void:
	$AnimatedSprite2D.play(ANIMATIONS[piece_type])
	$AnimatedSprite2D.set_frame_and_progress(0, 0)
	$AnimatedSprite2D.stop()

func shine() -> void:
	$AnimatedSprite2D.play(ANIMATIONS[piece_type])
	
