extends Node2D

const TILE_SIZE = 16

const I := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0)]
const O := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)]
const T := [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]
const S := [Vector2i(1, 0), Vector2i(2, 0), Vector2i(0, 1), Vector2i(1, 1)]
const Z := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(2, 1)]
const J := [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(2, 0)]
const L := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(2, 1)]

const TETROMINO_SHAPE := {
	"I" : I,
	"O" : O,
	"T" : T,
	"S" : S,
	"Z" : Z,
	"J" : J,
	"L" : L
}
var block_scene := preload("res://Scenes/Pieces/block.tscn")

var piece_type : String

func build(type : String) -> void:
	for child in get_children():
		child.free()
	piece_type = type
	for block_cords in TETROMINO_SHAPE[type]:
		var block = block_scene.instantiate()
		add_child(block)
		block.position = block_cords * TILE_SIZE
		if block.has_method("set_piece_type"):
			block.set_piece_type(type)
	self.center()

func shine() -> void:
	for block in get_children():
		if block.has_method("shine"):
			block.shine()

func spin(direction : String) -> void:
	var blocks_pos := get_blocks_pos()
	blocks_pos = get_rotated_matrix(direction, blocks_pos)
	var i := 0
	for block in get_children():
		block.position = blocks_pos[i]
		i += 1

func center() -> void:
	var max_width := 0
	var max_height := 0
	var blocks = get_children()

	for block in blocks:
		if block.position.x > max_width:
			max_width = block.position.x
		if block.position.y > max_height:
			max_height = block.position.y

	var offset = Vector2(floor(((max_width / TILE_SIZE) + 1) / 2.0), floor(((max_height / TILE_SIZE) + 1) / 2.0))

	for block in blocks:
		block.position -= offset * TILE_SIZE

func get_blocks_pos() -> Array:
	var block_pos : Array
	for block in get_children():
		block_pos.append(Vector2i(block.position))
	return block_pos

func get_rotated_matrix(rotation : String, matrix : Array) -> Array:
	var rotated_piece : Array
	rotated_piece.resize(len(matrix))

	if rotation == "Right":
		for i in len(matrix):
			rotated_piece[i] = Vector2i(-matrix[i].y, matrix[i].x)
	elif rotation == "Left":
		for i in len(matrix):
			rotated_piece[i] = Vector2i(matrix[i].y, -matrix[i].x)
	else:
		return matrix
	return rotated_piece
