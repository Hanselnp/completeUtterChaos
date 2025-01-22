extends Node3D

# Getting Arena grid_size variable and Specific generated cell for spawning
@onready var arena: Node3D = get_tree().root.find_child("ArenaGeneration", true, false)
@onready var cell: Area3D = get_tree().root.find_child("Cell_%d_%d" % [arena.grid_size.x/2, arena.grid_size.y/2], true, false)

# Pre-load player character
@export var player_unit: PackedScene
@export var summoned_unit: PackedScene

# Spawn coord
#var coordinate: Dictionary = arena.get_cell_coordinate()
#@export var spawn: Vector2i = coordinate[2]


func spawn_player(coordinate: Vector2, arena_grid: Dictionary):
	#var player = player_unit.instantiate()
	#
	## Assign cell name and position
	#player.name = "Player1"
	#add_child(player)
	#player.global_transform.origin = Vector3(arena.grid_size.x/2, 0, arena.grid_size.y/2)
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
