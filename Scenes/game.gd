extends Node2D

var piece_scene := preload("res://Scenes/Pieces/piece.tscn")

const TILE_SIZE := 16

const TETROMINOES := [
	"I", 
	"O", 
	"T", 
	"S", 
	"Z", 
	"J", 
	"L"
]

const BOARD_WIDTH := 10 * TILE_SIZE
const BOARD_HEIGHT := 20 * TILE_SIZE
const BOARD_POS := Vector2(16,1) * TILE_SIZE
var board_center : Vector2

const ANIMATION_DURATION := 0.1
const FALL_DISPERTION := 8
const SHAKE_STRENGH := 4
const SOFT_DROP_MULTIPLIER := 2
const HARD_DROP_MULTIPLIER := 4

const DAS_DELAY := 0.15
const DAS_SPEED := 0.05

const SOFT_DROP_ADD := 0.25

var das_delay_counter : float
var das_speed_counter : float

var piece : Node
var piece_pos : Vector2i
var blocks_pos : Array

var main_bag : Array
var buffer_bag : Array
var combo : Array

var score : int
var level : int
var total_lines_cleared : int
var speed : float
var acceleration : float
var step : float
var move_direction : Vector2i
var rotate_direction : String
var is_soft_drop : bool
var is_hard_drop : bool

func _ready() -> void:
	new_game()

func _process(delta: float) -> void:
	if is_hard_drop:
		hard_drop()
	if is_piece_to_step(delta):
		step_piece()
	if can_piece_move():
		move_piece(delta)
	if can_piece_rotate():
		rotate_piece()
	if is_game_over():
		game_over()
	rotate_direction = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("piece_move_left"):
		move_direction = Vector2i.LEFT
	if event.is_action_pressed("piece_move_right"):
		move_direction = Vector2i.RIGHT
	if event.is_action_released("piece_move_left") or event.is_action_released("piece_move_right"):
		move_direction = Vector2i.ZERO
	
	if event.is_action_pressed("piece_rotate_left"):
		rotate_direction = "Left"
	if event.is_action_pressed("piece_rotate_right"):
		rotate_direction = "Right"
		
	if event.is_action_pressed("piece_soft_drop"):
		is_soft_drop = true
	elif event.is_action_released("piece_soft_drop"):
		is_soft_drop = false
		
	if event.is_action_pressed("piece_hard_drop"):
		is_hard_drop = true

func new_game() -> void:
	randomize()
	board_center = $Board.position
	
	score = 0
	level = 1
	speed = 1.0
	
	rotate_direction = ""
	
	das_delay_counter = DAS_DELAY
	das_speed_counter = DAS_SPEED
	
	main_bag.shuffle()
	buffer_bag.shuffle()
	
	spawn_piece()

func set_level() -> void:
	level = floor(total_lines_cleared/10.0) + 1

func get_acceleration() -> float:
	return 1.25

func set_speed() -> void:
	speed = level * get_acceleration()

func set_score() -> void:
	score += (combo[-1] + ((2 ** len(combo) - 1))) * 100

func set_bag() -> void:
	if len(buffer_bag) <= 0:
		buffer_bag = TETROMINOES.duplicate()
		buffer_bag.shuffle()
	if len(main_bag) < len(TETROMINOES):
		main_bag.append(buffer_bag[0])
		buffer_bag.pop_front()

func is_game_over() -> bool:
	var blocks = $Board/Pieces.get_children()
	
	for block in blocks:
		if block.position.y <= BOARD_POS.y + 2 * TILE_SIZE:
			return true
	return false
	
func game_over() -> void:
	get_tree().quit()

func spawn_piece() -> void:
	set_bag()
	piece = piece_scene.instantiate()
	piece.build(main_bag[0])
	main_bag.pop_front()
	add_child(piece)
	@warning_ignore("integer_division")
	var start_pos := Vector2i((BOARD_POS.x + BOARD_WIDTH / 2), BOARD_POS.y + TILE_SIZE)
	piece.position = start_pos
	piece_pos = start_pos
	blocks_pos = piece.get_blocks_pos()

func animate_slide() -> void:
	var slide_tween = create_tween().set_parallel()
	slide_tween.tween_property(piece, "position", Vector2(piece_pos), ANIMATION_DURATION / sqrt(speed))

func animate_splash() -> void:
	var splash_tween = create_tween().set_parallel()
	splash_tween.tween_property(piece, "scale", Vector2(1, 1), ANIMATION_DURATION / sqrt(speed))

func animate_shake() -> void:
	var shake_tween = create_tween().set_parallel()
	shake_tween.tween_property($Board, "position", board_center, ANIMATION_DURATION / sqrt(speed))

func is_piece_to_step(delta : float) -> bool:
	step += (speed * delta)
	if is_soft_drop:
		step += SOFT_DROP_ADD
	if step >= 1:
		step = 0
		return true
	return false

func step_piece() -> void:
	var blocks : Array
	blocks = piece.get_blocks_pos()
	for i in range(blocks.size()):
		blocks[i] = (Vector2i.DOWN * TILE_SIZE) + piece_pos + Vector2i(blocks[i])
	if is_pos_valid(blocks):
		piece_pos += Vector2i.DOWN * TILE_SIZE
		animate_slide()
	else:
		lock_piece()
		clear_lines()

func hard_drop() -> void:
	var offsets = piece.get_blocks_pos()
	var test_pos = piece_pos
	while true:
		var next_pos = test_pos + Vector2i.DOWN * TILE_SIZE
		var valid = true
		for offset in offsets:
			var block_pos = next_pos + Vector2i(offset)
			if not is_pos_valid([block_pos]):
				valid = false
				break
		if not valid:
			break
		test_pos = next_pos
	piece_pos = test_pos
	piece.position = piece_pos
	lock_piece()
	clear_lines()
	step = 0
	is_hard_drop = false

func lock_piece():
	for block in piece.get_children():
		block.reparent($Board/Pieces)
		block.position = Vector2((round(block.position.x / TILE_SIZE) * TILE_SIZE),(ceil(block.position.y / TILE_SIZE) * TILE_SIZE))
		block.shine()
	piece.queue_free()
	if is_soft_drop:
		$Board.position += Vector2.DOWN * SHAKE_STRENGH * SOFT_DROP_MULTIPLIER
		animate_shake()
		spawn_piece()
	elif is_hard_drop:
		$Board.position += Vector2.DOWN * SHAKE_STRENGH * HARD_DROP_MULTIPLIER
		animate_shake()
		spawn_piece()
	else:
		$Board.position += Vector2.DOWN * SHAKE_STRENGH
		animate_shake()
		spawn_piece()

func is_pos_valid(vectors : Array) -> bool:
	for vect in vectors:
		if vect.x >= BOARD_WIDTH + BOARD_POS.x or vect.x < BOARD_POS.x or vect.y >= BOARD_HEIGHT + BOARD_POS.y or vect.y < BOARD_POS.y:
			return false
		for block in $Board/Pieces.get_children():
			if Vector2(vect) == block.position:
				return false
	return true

func can_piece_move() -> bool:
	var blocks : Array
	blocks = piece.get_blocks_pos()
	for i in range(blocks.size()):
		blocks[i] = (move_direction * TILE_SIZE) + piece_pos + Vector2i(blocks[i])
	return is_pos_valid(blocks)

func move_piece(delta : float) -> void:
	if move_direction == Vector2i.ZERO:
		das_delay_counter = DAS_DELAY
		das_speed_counter = DAS_SPEED
	else:
		if das_delay_counter == DAS_DELAY:
			piece_pos += move_direction * TILE_SIZE
			animate_slide()
			das_delay_counter -= delta
		elif das_delay_counter > 0:
			das_delay_counter -= delta
		else:
			if das_speed_counter <= 0:
				das_speed_counter = DAS_SPEED
				piece_pos += move_direction * TILE_SIZE
				animate_slide()
			else:
				das_speed_counter -= delta
		blocks_pos = piece.get_blocks_pos()

func can_piece_rotate() -> bool:
	if rotate_direction == "": return false
	var rotated_local_matrix = piece.get_rotated_matrix(rotate_direction, piece.get_blocks_pos())
	var rotated_global_matrix : Array = []
	for local_pos in rotated_local_matrix:
		var global_pos = piece_pos + Vector2i(local_pos)
		rotated_global_matrix.append(global_pos)
	return is_pos_valid(rotated_global_matrix)

func rotate_piece() -> void:
	piece.spin(rotate_direction)
	rotate_direction = ""
	blocks_pos = piece.get_blocks_pos()
	piece.scale = Vector2(0.75, 0.75)
	animate_splash()

func clear_lines() -> void:
	var lines := {}
	var blocks = $Board/Pieces.get_children()
	
	for block in blocks:
		var y = block.position.y
		lines[y] = lines.get(y, 0) + 1
	
	var full_lines := []
	for y in lines.keys():
		if lines[y] == BOARD_WIDTH / TILE_SIZE:
			full_lines.append(y)
	
	if len(full_lines) > 0:
		total_lines_cleared += len(full_lines)
		combo.append(len(full_lines))
		set_score()
		set_level()
		set_speed()
			
		full_lines.sort()
	
		handle_line_removal(full_lines)
	else:
		combo.clear()

func handle_line_removal(full_lines: Array):
	var blocks = $Board/Pieces.get_children()
	
	for block in blocks:
		if block.position.y in full_lines:
			block.queue_free()

	await get_tree().process_frame 
	
	var remaining_blocks = $Board/Pieces.get_children()
	var fall_tween = create_tween().set_parallel(true)
	
	for block in remaining_blocks:
		var shift_amount := 0
		for line_y in full_lines:
			if block.position.y < line_y:
				shift_amount += TILE_SIZE
		if shift_amount > 0:
			if is_soft_drop:
				fall_tween.tween_property(block, "position:y", block.position.y + shift_amount, ANIMATION_DURATION * randf() * FALL_DISPERTION * SOFT_DROP_MULTIPLIER)\
					.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
			elif is_hard_drop:
				fall_tween.tween_property(block, "position:y", block.position.y + shift_amount, ANIMATION_DURATION * randf() * FALL_DISPERTION * HARD_DROP_MULTIPLIER)\
					.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
			else:
				fall_tween.tween_property(block, "position:y", block.position.y + shift_amount, ANIMATION_DURATION * randf() * FALL_DISPERTION)\
					.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
