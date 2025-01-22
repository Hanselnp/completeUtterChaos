extends Node3D

# Pre-loading scenes
@export var cell_scene: PackedScene
#@export var enemy_cell_scene: PackedScene

# Arena grid size setting 
# Vector2i(x, y) treat x as x axis and y as z axis. Default is Vector2i(5, 10) 
@export var grid_size: Vector2i = Vector2i(5, 10) 

# Arena spacing between grids
@export var cell_spacing: float = 10.5

# Grid coordination in 2d array form
var arena_grid: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_arena()
	print(arena_grid)

func generate_arena():
	for x in range(grid_size.x):
		for z in range(grid_size.y):
			# Determine wheter cell is on player side (x: 0 - 4) or enemy side (x: 5 - 9)
			var is_player_side = z < grid_size.y / 2
			print(not is_player_side)
			#var cell_scene = player_cell_scene if is_player_side else enemy_cell_scene
			var cell_scene_type = cell_scene 
			
			var cell = cell_scene_type.instantiate()
			
			# Assign cell name and add the node ass ArenaGeneration's child
			cell.name = "Cell_%d_%d" % [x,z]
			add_child(cell)
			
			# If is_player_side = false, run is_enemy_cell func in cell script to change color 
			# (and its cell_type atribute to enemy cell, to be implemented)
			
			cell.identify_cell(is_player_side)
				
			# Assignr position to the cell
			cell.global_transform.origin = Vector3(x * cell_spacing, 0, z * cell_spacing)
			
			# Add cell to the grid coordinate dictionary
			arena_grid[Vector2(x, z)] = cell
			
			
func get_cell_position(position: Vector2) -> Area3D:
	return arena_grid.get(position, null)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
