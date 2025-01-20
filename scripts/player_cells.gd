extends Area3D

# Deteminded movement cost 
@export var movement_cost: int = 1

# Whether this cell belongs to the player's side
var is_player_side: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Determine side based on the cell's position
	var z_coord = global_transform.origin.z / 10.5  # Assuming spacing is 1.5
	is_player_side = z_coord < 5  # Player side is in the first 5 rows


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
