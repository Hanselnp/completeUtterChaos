extends CharacterBody3D

# Spawn coord
var 
@export var spawn: Vector2i = Vector2i(arena.grid_size.x/2, arena.grid_size.y/2)

# State player's stats
@export var health_point: int = 10
@export var movement_point: int = 5
@export var action_point: int = 3

func _on_ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	# func is_hit
	# func interact
	
	pass
