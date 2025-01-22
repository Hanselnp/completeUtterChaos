extends Area3D

# Deteminded movement cost 
@export var movement_cost: int = 1

# Units currently on this cell
var units_on_cell: Array = []

signal units_changed

# Whether this cell belongs to the player's side
var is_player_side: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Determine side based on the cell's position
	var z_coord = global_transform.origin.z / 10.5  # Assuming spacing is 1.5
	is_player_side = z_coord < 5  # Player side is in the first 5 rows
	
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)

func _on_body_entered(body):
	units_on_cell.append(body)
	emit_signal("units_changed")

func _on_body_exited(body):
	units_on_cell.erase(body)
	emit_signal("units_changed")

func is_enemy_cell():
	if $CSGBox3D:
		# Duplicate the material to avoid modifying the original
		var new_material = $CSGBox3D.material.duplicate()
		# Set a random color
		new_material.albedo_color = Color(0.75, 0, 0)
		# Apply the new material to the CSGBox3D
		$CSGBox3D.material = new_material
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
