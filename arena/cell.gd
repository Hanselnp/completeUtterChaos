extends Area3D

# Deteminded movement cost 
@export var movement_cost: int = 1

# Pre-loading scene for future asset change, check inspector in the right.
#@export var scene: PackedScene

# Units currently on this cell
var units_on_cell: Array = []

signal units_changed

# Whether this cell belongs to the player's side
var is_player_side: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func identify_cell(is_player: bool):
	# Guard clause to skip func is somehow CSGBox3D is no longer cell node's child
	if not $CSGBox3D:
		print("Error: CSGBox3D missing, is no longer cell node's child")
		pass
	
	# Duplicate the material to avoid modifying the original
	var new_material = $CSGBox3D.material.duplicate()
	
	# if enemy -> cell_red else cell_blue
	var new_color = Color(0.75, 0, 0) if not is_player else Color(0, 0, 0.75)
	
	new_material.albedo_color = new_color
	$CSGBox3D.material = new_material
	
	# Need to put cell_type_identifier here later incase cells will be more unique later


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body):
	units_on_cell.append(body)
	emit_signal("units_changed")

func _on_body_exited(body):
	units_on_cell.erase(body)
	emit_signal("units_changed")
