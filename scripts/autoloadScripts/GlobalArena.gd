extends Node

# Making the arena information available for all

var arena_grid: Dictionary = {}
var arena_size: Vector2i
#var cell_spacing: int


func set_arena_dictionary(input_arena_data: Dictionary):
	arena_grid = input_arena_data
	print("Arena dictionary saved")
	
func set_arena_size(size: Vector2i):
	arena_size = size
	#print(arena_size)

# Getting arena size in Vector2i
func get_arena_size():
	return arena_size

# Getting position on a specific cell, get_cell_position(Vector2(x, z)), is enemy cell when z > grid.y/2 
func get_cell(position: Vector2) -> Area3D:
	return arena_grid.get(position, null)
	
