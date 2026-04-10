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

var piece_shapes = {
	"i" : i, "t" : t, "o" : o, "z" : z, "s" : s, "l" : l, "j" : j
}

var piece_colors = {
	"i" : Vector2i(1,1), "t" : Vector2i(0,2), "o" : Vector2i(2,0),
	"z" : Vector2i(0,1), "s" : Vector2i(0,0), "l" : Vector2i(1,0),
	"j" : Vector2i(2,1)
}

const COLS : int = 10
const ROWS : int = 20
const ORIGIN := Vector2i(19, 3)

var bag = []
var piece_shape
var piece_color
var rotation_index : int = 0
var active_piece : Array
var cur_pos : Vector2i
var level : int = 1
var tile_id : int = 0
var speed : float = 1.0
var steps : float = 0.0

func _ready():
	new_game()

func new_game():
	$Pieces.clear()
	speed = 1.0
	steps = 0.0
	bag.clear()
	spawn_next_piece()

func spawn_next_piece():
	var key = pick_piece_key()
	piece_shape = piece_shapes[key]
	piece_color = piece_colors[key]
	rotation_index = 0
	cur_pos = ORIGIN
	active_piece = piece_shape[rotation_index]
	
	if not can_move(Vector2i.ZERO):
		new_game()
	else:
		draw_piece(active_piece, cur_pos, piece_color)

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
		$Pieces.set_cell(pos + i, tile_id, atlas)

func move_piece(dir):
	if can_move(dir):
		clear_piece()
		cur_pos += dir
		draw_piece(active_piece, cur_pos, piece_color)
		return true
	elif dir == Vector2i.DOWN:
		lock_piece()
	return false

func rotate_piece():
	if can_rotate():
		clear_piece()
		rotation_index = (rotation_index + 1) % 4
		active_piece = piece_shape[rotation_index]
		draw_piece(active_piece, cur_pos, piece_color)

func lock_piece():
	check_lines()
	spawn_next_piece()

func is_free(pos):
	if pos.x < ORIGIN.x or pos.x >= ORIGIN.x + COLS or pos.y >= ORIGIN.y + ROWS:
		return false
	if $Pieces.get_cell_source_id(pos) != -1:
		for i in active_piece:
			if pos == cur_pos + i:
				return true
		return false
	return true

func can_move(dir):
	for i in active_piece:
		if not is_free(i + cur_pos + dir):
			return false
	return true

func can_rotate():
	var temp_index = (rotation_index + 1) % 4
	for i in piece_shape[temp_index]:
		if not is_free(i + cur_pos):
			return false
	return true

func check_lines():
	for y in range(ORIGIN.y + ROWS - 1, ORIGIN.y - 1, -1):
		var is_full = true
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			if $Pieces.get_cell_source_id(Vector2i(x, y)) == -1:
				is_full = false
				break
		if is_full:
			delete_line(y)
			check_lines()
			break

func delete_line(y):
	for row in range(y, ORIGIN.y, -1):
		for x in range(ORIGIN.x, ORIGIN.x + COLS):
			var atlas = $Pieces.get_cell_atlas_coords(Vector2i(x, row - 1))
			var source = $Pieces.get_cell_source_id(Vector2i(x, row - 1))
			$Pieces.set_cell(Vector2i(x, row), source, atlas)
	for x in range(ORIGIN.x, ORIGIN.x + COLS):
		$Pieces.erase_cell(Vector2i(x, ORIGIN.y))

func _process(delta):
	steps += speed * delta
	if steps >= 1.0:
		move_piece(Vector2i.DOWN)
		steps = 0.0

	if Input.is_action_just_pressed("ui_left"):
		move_piece(Vector2i.LEFT)
	elif Input.is_action_just_pressed("ui_right"):
		move_piece(Vector2i.RIGHT)
	elif Input.is_action_just_pressed("ui_up"):
		rotate_piece()
	elif Input.is_action_just_pressed("ui_down"):
		move_piece(Vector2i.DOWN)
