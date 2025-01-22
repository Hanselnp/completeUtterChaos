extends Node

# Making the arena information available for all

var arena_grid: Dictionary = {}
var arena_x_axis: int
var arena_z_axis: int


func input_arena_dictionary(input_arena_data: Dictionary):
	arena_grid = input_arena_data
	print("Arena dictionary saved")
	
	get_cell_position(Vector2(0, 0))
	
func input_arena_axis(x: int,z: int):
	arena_x_axis = x
	arena_z_axis = z


# Getting position on a specific cell, get_cell_position(Vector2(x, z)), is enemy cell when z > grid.y/2 
func get_cell_position(position: Vector2) -> Area3D:
	return arena_grid.get(position, null)
	
