extends Node2D

var i_0 := [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1)]
var i_90 := [Vector2i(2, 0), Vector2i(2, 1), Vector2i(2, 2), Vector2i(2, 3)]
var i_180 := [Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2), Vector2i(3, 2)]
var i_270 := [Vector2i(1, 0), Vector2i(1, 1), Vector2i(1, 2), Vector2i(1, 3)]
var i := [i_0, i_90, i_180, i_270]

var t_0 := [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]
var t_90 := [Vector2i(1, 0), Vector2i(1, 1), Vector2i(2, 1), Vector2i(1, 2)]
var t_180 := [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(1, 2)]
var t_270 := [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(1, 2)]
var t := [t_0, t_90, t_180, t_270]

var o_0 := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)]
var o_90 := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)]
var o_180 := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)]
var o_270 := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)]
var o := [o_0, o_90, o_180, o_270]

var z_0 := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(2, 1)]
var z_90 := [Vector2i(2, 0), Vector2i(1, 1), Vector2i(2, 1), Vector2i(1, 2)]
var z_180 := [Vector2i(0, 1), Vector2i(1, 1), Vector2i(1, 2), Vector2i(2, 2)]
var z_270 := [Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(0, 2)]
var z := [z_0, z_90, z_180, z_270]

var s_0 := [Vector2i(1, 0), Vector2i(2, 0), Vector2i(0, 1), Vector2i(1, 1)]
var s_90 := [Vector2i(1, 0), Vector2i(1, 1), Vector2i(2, 1), Vector2i(2, 2)]
var s_180 := [Vector2i(1, 1), Vector2i(2, 1), Vector2i(0, 2), Vector2i(1, 2)]
var s_270 := [Vector2i(0, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(1, 2)]
var s := [s_0, s_90, s_180, s_270]

var l_0 := [Vector2i(2, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]
var l_90 := [Vector2i(1, 0), Vector2i(1, 1), Vector2i(1, 2), Vector2i(2, 2)]
var l_180 := [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(0, 2)]
var l_270 := [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1), Vector2i(1, 2)]
var l := [l_0, l_90, l_180, l_270]

var j_0 := [Vector2i(0, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1)]
var j_90 := [Vector2i(1, 0), Vector2i(2, 0), Vector2i(1, 1), Vector2i(1, 2)]
var j_180 := [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(2, 2)]
var j_270 := [Vector2i(1, 0), Vector2i(1, 1), Vector2i(0, 2), Vector2i(1, 2)]
var j := [j_0, j_90, j_180, j_270]

var piece_shapes = { "i" : i, "t" : t, "o" : o, "z" : z, "s" : s, "l" : l, "j" : j }
var piece_colors = { "i" : Vector2i(1,1), "t" : Vector2i(0,2), "o" : Vector2i(2,0), "z" : Vector2i(0,1), "s" : Vector2i(0,0), "l" : Vector2i(1,0), "j" : Vector2i(2,1) }
var piece_icons = { "i" : [Vector2i(2, 0), Vector2i(3, 0), Vector2i(2, 1), Vector2i(3, 1)], "t" : [Vector2i(0, 4), Vector2i(1, 4), Vector2i(0, 5), Vector2i(1, 5)], "o" : [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)], "z" : [Vector2i(0, 2), Vector2i(1, 2), Vector2i(0, 3), Vector2i(1, 3)], "s" : [Vector2i(4, 0), Vector2i(5, 0), Vector2i(4, 1), Vector2i(5, 1)], "l" : [Vector2i(2, 2), Vector2i(3, 2), Vector2i(2, 3), Vector2i(3, 3)], "j" : [Vector2i(4, 2), Vector2i(5, 2), Vector2i(4, 3), Vector2i(5, 3)] }
var piece_stats = { "i": 0, "t": 0, "o": 0, "z": 0, "s": 0, "l": 0, "j": 0 }
var stat_pos = { "i" : Vector2i(5,8), "t" : Vector2i(5,23), "o" : Vector2i(5,5), "z" : Vector2i(5,14), "s" : Vector2i(5,11), "l" : Vector2i(5,17), "j" : Vector2i(5,20) }
var numbers = [Vector2i(10,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0), Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0)]

const COLS : int = 10
const ROWS : int = 20
const ORIGIN := Vector2i(19, 3)
const SCORE_POS := Vector2i(41, 3)
const LEVEL_POS := Vector2i(41, 6)
const PREVIEW_POS := Vector2i(44, 13)
const REWARDS = { 1: 100, 2: 300, 3: 500, 4: 800 }
const LOCK_DELAY : float = 0.5
const GHOST_TILE := Vector2i(2, 2)

@onready var piece_tilemap: TileMapLayer = $Pieces
@onready var ghost_tilemap: TileMapLayer = $Ghost
@onready var text_tilemap: TileMapLayer = $TextMod

var das_delay: float = 0.15
var das_speed: float = 0.05
var das_timer: float = 0.0
var bag: Array = []
var piece_shape: Array
var piece_color: Vector2i
var rotation_index: int = 0
var active_piece: Array
var cur_pos: Vector2i
var score: int = 0
var level: int = 1
var lines_cleared: int = 0
var tiles_id: int = 0
var numbers_id: int = 2
var speed: float = 1.0
var steps: float = 0.0
var lock_timer: float = 0.0
var game_running: bool = false

var current_piece_coords: Array[Vector2i] = []

func _ready() -> void:
	new_game()

func new_game() -> void:
	piece_tilemap.clear()
	ghost_tilemap.clear()
	score = 0
	level = 1
	lines_cleared = 0
	speed = 1.0
	steps = 0.0
	lock_timer = 0.0
	game_running = true
	bag.clear()
	for k in piece_stats: piece_stats[k] = 0
	update_stats_display()
	display_number(score, SCORE_POS, 6)
	display_number(level, LEVEL_POS, 2)
	spawn_next_piece()
	update_preview()

func game_over() -> void:
	game_running = false
	var used = piece_tilemap.get_used_cells()
	for cell in used:
		piece_tilemap.set_cell(cell, tiles_id, GHOST_TILE)

func spawn_next_piece() -> void:
	if not game_running: return
	var key = pick_piece_key()
	track_piece(key)
	update_stats_display()
	piece_shape = piece_shapes[key]
	piece_color = piece_colors[key]
	rotation_index = 0
	cur_pos = ORIGIN + Vector2i(COLS / 2 - 1, 0)
	active_piece = piece_shape[rotation_index]
	lock_timer = 0.0
	
	if not can_move_logic(cur_pos, active_piece):
		draw_state()
		game_over()
	else:
		draw_state()

func pick_piece_key() -> String:
	if bag.is_empty():
		bag = piece_shapes.keys().duplicate()
		bag.shuffle()
	return bag.pop_front()

func draw_state() -> void:
	ghost_tilemap.clear()
	
	for coord in current_piece_coords:
		piece_tilemap.erase_cell(coord)
	current_piece_coords.clear()

	var g_pos = cur_pos
	while can_move_logic(g_pos + Vector2i.DOWN, active_piece):
		g_pos += Vector2i.DOWN
	
	for i in active_piece:
		var p_coord = cur_pos + i
		ghost_tilemap.set_cell(g_pos + i, tiles_id, GHOST_TILE)
		piece_tilemap.set_cell(p_coord, tiles_id, piece_color)
		current_piece_coords.append(p_coord)

func move_piece(dir: Vector2i) -> bool:
	if not game_running: return false
	if can_move_logic(cur_pos + dir, active_piece):
		cur_pos += dir
		draw_state()
		return true
	return false

func rotate_piece() -> void:
	if not game_running: return
	var next_idx = (rotation_index + 1) % 4
	var next_shape = piece_shape[next_idx]
	var kicks = [Vector2i.ZERO, Vector2i.LEFT, Vector2i.RIGHT, Vector2i(0, -1)]
	
	for offset in kicks:
		if can_move_logic(cur_pos + offset, next_shape):
			cur_pos += offset
			rotation_index = next_idx
			active_piece = next_shape
			draw_state()
			lock_timer = 0.0
			return

func lock_piece() -> void:
	current_piece_coords.clear()
	ghost_tilemap.clear()
	check_lines()
	spawn_next_piece()
	update_preview()

func can_move_logic(pos: Vector2i, shape: Array) -> bool:
	for tile in shape:
		var target = pos + tile
		if target.x < ORIGIN.x or target.x >= ORIGIN.x + COLS or target.y >= ORIGIN.y + ROWS:
			return false
		
		var sid = piece_tilemap.get_cell_source_id(target)
		if sid != -1:
			if not target in current_piece_coords:
				return false
	return true

func check_lines() -> void:
	var lines_to_clear: Array = []
	for y in range(ORIGIN.y, ORIGIN.y + ROWS):
		var full = true
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			if piece_tilemap.get_cell_source_id(Vector2i(x, y)) == -1:
				full = false
				break
		if full:
			lines_to_clear.append(y)
	
	if lines_to_clear.size() > 0:
		for line_y in lines_to_clear:
			delete_line(line_y)
		lines_cleared += lines_to_clear.size()
		calculate_score(lines_to_clear.size())
		set_level()
		set_speed()

func delete_line(y: int) -> void:
	for row in range(y, ORIGIN.y, -1):
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			var atlas = piece_tilemap.get_cell_atlas_coords(Vector2i(x, row - 1))
			var source = piece_tilemap.get_cell_source_id(Vector2i(x, row - 1))
			piece_tilemap.set_cell(Vector2i(x, row), source, atlas)
	for x in range(ORIGIN.x, ORIGIN.x + COLS):
		piece_tilemap.erase_cell(Vector2i(x, ORIGIN.y))

func track_piece(key: String) -> void:
	if piece_stats.has(key): piece_stats[key] += 1

func calculate_score(lines: int) -> void:
	score += REWARDS.get(lines, 100) * level
	display_number(score, SCORE_POS, 6)

func set_level() -> void:
	level = (lines_cleared / 10) + 1
	display_number(level, LEVEL_POS, 2)

func set_speed() -> void:
	speed = 1.0 + (level - 1) * 0.15

func display_number(value: int, start_pos: Vector2i, max_size: int) -> void:
	for i in range(max_size): text_tilemap.erase_cell(start_pos + Vector2i(i, 0))
	var s_val = str(value)
	for i in range(s_val.length()):
		if i >= max_size: break
		text_tilemap.set_cell(start_pos + Vector2i(i, 0), numbers_id, numbers[int(s_val[i])])

func display_icon(icon: String, start_pos: Vector2i) -> void:
	for i in 12:
		text_tilemap.erase_cell(start_pos + Vector2i(0, i))
		text_tilemap.erase_cell(start_pos + Vector2i(1, i))
	for i in range(4):
		text_tilemap.set_cell(start_pos + Vector2i(i%2, i/2), 4, piece_icons[icon][i])

func update_stats_display() -> void:
	for type in stat_pos.keys():
		display_number(clampi(piece_stats[type], 0, 99), stat_pos[type], 2)

func update_preview() -> void:
	for i in bag.size():
		display_icon(bag[i], (PREVIEW_POS + Vector2i(0, (2 * i))))
	if bag.size() == 0:
		text_tilemap.erase_cell(PREVIEW_POS + Vector2i(0, 0))
		text_tilemap.erase_cell(PREVIEW_POS + Vector2i(1, 0))
		text_tilemap.erase_cell(PREVIEW_POS + Vector2i(0, 1))
		text_tilemap.erase_cell(PREVIEW_POS + Vector2i(1, 1))

func _process(delta: float) -> void:
	if not game_running: return

	steps += speed * delta
	if steps >= 1.0:
		if can_move_logic(cur_pos + Vector2i.DOWN, active_piece):
			move_piece(Vector2i.DOWN)
		steps = 0.0

	if not can_move_logic(cur_pos + Vector2i.DOWN, active_piece):
		lock_timer += delta
		if lock_timer >= LOCK_DELAY / speed:
			lock_piece()
	else:
		lock_timer = 0.0

	if Input.is_action_just_pressed("ui_up"): rotate_piece()
	if Input.is_action_pressed("ui_down"): steps += delta * 20
	
	var dir = Vector2i.ZERO
	if Input.is_action_pressed("ui_left"): dir = Vector2i.LEFT
	elif Input.is_action_pressed("ui_right"): dir = Vector2i.RIGHT
	
	if dir != Vector2i.ZERO:
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			if move_piece(dir): lock_timer = 0.0
			das_timer = 0.0
		else:
			das_timer += delta
			if das_timer >= das_delay:
				if move_piece(dir): lock_timer = 0.0
				das_timer = das_delay - das_speed
	else:
		das_timer = 0.0
