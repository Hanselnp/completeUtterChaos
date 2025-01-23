extends Node3D

## Get arena size
#var arena_size: Vector2i = GlobalArena.get_arena_size()
##var cell_spacing = GlobalArena.get_cell_spacing()
#var spawn: Vector2i = Vector2i(arena_size.x/2, arena_size.y/2)
#
## Assign cell position from cell
#var cell_position: Vector3 = GlobalArena.get_cell(spawn).global_transform.origin
#
## Load character
#@export var player_character: PackedScene

#func _on_ready() -> void:
	#print("spawning player")
	#spawn_player()
	
#func spawn_player():
	#var new_player = player_character.instantiate()
	#add_child(new_player)
	#
	#new_player.global_transform.origin = cell_position
