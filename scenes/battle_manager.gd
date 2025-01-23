extends Node3D

# Going to put dictionary of units in to the array of PackedScene for dynamic unit placement

# Pre-loading units on board
@export var player: PackedScene
@export var summons: PackedScene
@export var enemy: PackedScene

var target_cell_position: Vector3
var arena_size: Vector2i
var player_spawn: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arena_size = get_arena_size_local()
	player_spawn = get_player_spawn_location()
	
	print("Spawning player in:")
	print(player_spawn)
	
	spawn_player()

# Sapwn player in arena, gonna put arguments, turn from spawn_player to spawn_units later
func spawn_player():
	
	# if player or summon, else enemy
	
	# Assign player position from cell position
	target_cell_position = GlobalArena.get_cell(player_spawn).global_transform.origin
	
	# Adding player to the arena
	var new_player = player.instantiate()
	add_child(new_player)
	new_player.global_transform.origin = target_cell_position

# Get arena size
func get_arena_size_local() -> Vector2i:
	return GlobalArena.get_arena_size()
	
# Determine where player is spawned
func get_player_spawn_location() -> Vector2i:
	return Vector2i(arena_size.x/2, arena_size.y/4)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Turn management here
	pass
