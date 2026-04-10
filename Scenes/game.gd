extends TileMap

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

var piece_colors = {
	"i" : Vector2i(1,1), "t" : Vector2i(0,2), "o" : Vector2i(2,0),
	"z" : Vector2i(0,1), "s" : Vector2i(0,0), "l" : Vector2i(1,0), "j" : Vector2i(2,1)
}

var piece_icons = { 
	"i" : [Vector2i(2, 0), Vector2i(3, 0), Vector2i(2, 1), Vector2i(3, 1)],
	"t" : [Vector2i(0, 4), Vector2i(1, 4), Vector2i(0, 5), Vector2i(1, 5)],
	"o" : [Vector2i(0, 0), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)],
	"z" : [Vector2i(0, 2), Vector2i(1, 2), Vector2i(0, 3), Vector2i(1, 3)],
	"s" : [Vector2i(4, 0), Vector2i(5, 0), Vector2i(4, 1), Vector2i(5, 1)],
	"l" : [Vector2i(2, 2), Vector2i(3, 2), Vector2i(2, 3), Vector2i(3, 3)],
	"j" : [Vector2i(4, 2), Vector2i(5, 2), Vector2i(4, 3), Vector2i(5, 3)] 
}

var piece_stats = { "i": 0, "t": 0, "o": 0, "z": 0, "s": 0, "l": 0, "j": 0 }

var stat_pos = {
	"i" : Vector2i(5,8), "t" : Vector2i(5,23), "o" : Vector2i(5,5),
	"z" : Vector2i(5,14), "s" : Vector2i(5,11), "l" : Vector2i(5,17), "j" : Vector2i(5,20)
}

var numbers = [
	Vector2i(10,0), Vector2i(1,0), Vector2i(2,0), Vector2i(3,0), Vector2i(4,0),
	Vector2i(5,0), Vector2i(6,0), Vector2i(7,0), Vector2i(8,0), Vector2i(9,0)
]

const COLS : int = 10
const ROWS : int = 20
const ORIGIN := Vector2i(19, 3)
const SCORE_POS := Vector2i(41, 3)
const LEVEL_POS := Vector2i(41, 6)
const REWARDS = { 1: 100, 2: 300, 3: 500, 4: 800 }
const CUTOFF : int = 10

var das_delay: float = 0.15
var das_speed: float = 0.05
var das_timer: float = 0.0
var bag = []
var piece_shape
var piece_color
var rotation_index : int = 0
var active_piece : Array
var cur_pos : Vector2i
var score : int = 0
var level : int = 1
var lines_cleared : int = 0
var tiles_id : int = 0
var numbers_id : int = 2
var speed : float = 1.0
var steps : float = 0.0
var game_running : bool = false
var game_over_time : int = 0

func _ready():
	new_game()

func new_game():
	$Pieces.clear()
	score = 0
	level = 1
	lines_cleared = 0
	speed = 1.0
	steps = 0.0
	game_running = true
	game_over_time = 0
	bag.clear()
	for k in piece_stats: piece_stats[k] = 0
	update_stats_display()
	display_number(score, SCORE_POS, 6)
	display_number(level, LEVEL_POS, 2)
	spawn_next_piece()
	update_preview()

func game_over():
	game_running = false
	var used_cells = $Pieces.get_used_cells()
	for cell in used_cells:
		$Pieces.set_cell(cell, tiles_id, Vector2i(2, 2))

func spawn_next_piece():
	if not game_running: return
	var key = pick_piece_key()
	track_piece(key)
	update_stats_display()
	piece_shape = piece_shapes[key]
	piece_color = piece_colors[key]
	rotation_index = 0
	cur_pos = ORIGIN
	active_piece = piece_shape[rotation_index]
	
	if not can_move(Vector2i.ZERO):
		draw_piece(active_piece, cur_pos, piece_color)
		game_over()
	else:
		handle_buffer()
		draw_piece(active_piece, cur_pos, piece_color)

func handle_buffer():
	if Input.is_action_pressed("ui_up"): rotate_piece()
	if Input.is_action_pressed("ui_left"): move_piece(Vector2i.LEFT)
	if Input.is_action_pressed("ui_right"): move_piece(Vector2i.RIGHT)

func pick_piece_key():
	if bag.is_empty():
		bag = piece_shapes.keys().duplicate()
		bag.shuffle()
	return bag.pop_front()

func clear_piece():
	for i in active_piece:
		$Pieces.erase_cell(cur_pos + i)

func draw_piece(piece, pos, atlas):
	for i in piece:
		$Pieces.set_cell(pos + i, tiles_id, atlas)

func move_piece(dir):
	if not game_running: return false
	if can_move(dir):
		clear_piece()
		cur_pos += dir
		draw_piece(active_piece, cur_pos, piece_color)
		return true
	elif dir == Vector2i.DOWN:
		lock_piece()
	return false

func rotate_piece():
	if not game_running: return
	if can_rotate():
		clear_piece()
		rotation_index = (rotation_index + 1) % 4
		active_piece = piece_shape[rotation_index]
		draw_piece(active_piece, cur_pos, piece_color)

func lock_piece():
	check_lines()
	spawn_next_piece()
	update_preview()

func is_free(pos):
	if pos.x < ORIGIN.x or pos.x >= ORIGIN.x + COLS or pos.y >= ORIGIN.y + ROWS:
		return false
	
	var sid = $Pieces.get_cell_source_id(pos)
	if sid == -1: 
		return true
		
	var current_tile_color = $Pieces.get_cell_atlas_coords(pos)
	
	if current_tile_color != piece_color:
		return false
		
	for i in active_piece:
		if pos == cur_pos + i:
			return true
			
	return false

func can_move(dir):
	for i in active_piece:
		if not is_free(i + cur_pos + dir): return false
	return true

func can_rotate():
	var next_idx = (rotation_index + 1) % 4
	for i in piece_shape[next_idx]:
		if not is_free(i + cur_pos): return false
	return true

func check_lines():
	for y in range(ORIGIN.y + ROWS - 1, ORIGIN.y - 1, -1):
		var full = true
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			if $Pieces.get_cell_source_id(Vector2i(x, y)) == -1:
				full = false
				break
		if full:
			delete_line(y)
			var lines_this_pass = 1 + check_lines_silent()
			lines_cleared += lines_this_pass
			calculate_score(lines_this_pass)
			set_level()
			set_speed()
			return
	return

func check_lines_silent():
	for y in range(ORIGIN.y + ROWS - 1, ORIGIN.y - 1, -1):
		var full = true
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			if $Pieces.get_cell_source_id(Vector2i(x, y)) == -1:
				full = false
				break
		if full:
			delete_line(y)
			return 1 + check_lines_silent()
	return 0

func delete_line(y):
	for row in range(y, ORIGIN.y, -1):
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			var atlas = $Pieces.get_cell_atlas_coords(Vector2i(x, row - 1))
			var source = $Pieces.get_cell_source_id(Vector2i(x, row - 1))
			$Pieces.set_cell(Vector2i(x, row), source, atlas)
	for x in range(ORIGIN.x, ORIGIN.x + COLS):
		$Pieces.erase_cell(Vector2i(x, ORIGIN.y))

func track_piece(key: String):
	if piece_stats.has(key): piece_stats[key] += 1

func calculate_score(lines: int):
	if lines in REWARDS:
		score += REWARDS[lines] * level
		display_number(score, SCORE_POS, 6)

func set_level():
	level = (lines_cleared / 10) + 1
	display_number(level, LEVEL_POS, 2)

func set_speed():
	if level < CUTOFF:
		speed = 1.0 + (level - 1) * (sqrt(CUTOFF) / CUTOFF)
	else:
		speed = 1.0 + sqrt(level)

func display_number(value: int, start_pos: Vector2i, max_size: int):
	for i in range(max_size): $TextMod.erase_cell(start_pos + Vector2i(i, 0))
	var s_val = str(value)
	for i in range(s_val.length()):
		if i >= max_size: break
		$TextMod.set_cell(start_pos + Vector2i(i, 0), numbers_id, numbers[int(s_val[i])])

func display_icon(icon: String, start_pos: Vector2i):
	for i in 12:
		$TextMod.erase_cell(start_pos + Vector2i(0, i))
		$TextMod.erase_cell(start_pos + Vector2i(1, i))

	$TextMod.set_cell(start_pos + Vector2i(0, 0), 4, piece_icons[icon][0])
	$TextMod.set_cell(start_pos + Vector2i(1, 0), 4, piece_icons[icon][1])
	$TextMod.set_cell(start_pos + Vector2i(0, 1), 4, piece_icons[icon][2])
	$TextMod.set_cell(start_pos + Vector2i(1, 1), 4, piece_icons[icon][3])

func update_stats_display():
	for type in stat_pos.keys():
		display_number(clampi(piece_stats[type], 0, 99), stat_pos[type], 2)

func update_preview():
	for i in bag.size():
		display_icon(bag[i], Vector2i(44,13 + (2 * i)))
	if bag.size() == 0:
		$TextMod.erase_cell(Vector2i(44,13) + Vector2i(0, 0))
		$TextMod.erase_cell(Vector2i(44,13) + Vector2i(1, 0))
		$TextMod.erase_cell(Vector2i(44,13) + Vector2i(0, 1))
		$TextMod.erase_cell(Vector2i(44,13) + Vector2i(1, 1))

func _process(delta):
	if not game_running:
		game_over_time += 1 * delta
		
		if game_over_time >= 2:
			pass

	steps += speed * delta
	if steps >= 1.0:
		move_piece(Vector2i.DOWN)
		steps = 0.0
	if Input.is_action_just_pressed("ui_up"): rotate_piece()
	if Input.is_action_pressed("ui_down"): steps += delta * 20
	var dir = Vector2i.ZERO
	if Input.is_action_pressed("ui_left"): dir = Vector2i.LEFT
	elif Input.is_action_pressed("ui_right"): dir = Vector2i.RIGHT
	if dir != Vector2i.ZERO:
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			move_piece(dir)
			das_timer = 0.0
		else:
			das_timer += delta
			if das_timer >= das_delay:
				move_piece(dir)
				das_timer = das_delay - das_speed
	else:
		das_timer = 0.0
