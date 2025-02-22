extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Lineser").get_material().set_shader_parameter("adjust", Vector3(randf_range(-0.5, 0.4), randf_range(-0.5, 0.4), randf_range(-0.5, 0.4)))
	get_node("Lineser").get_material().set_shader_parameter("offset", Vector3(randf_range(-0.0, 6.28394), randf_range(-0.0, 6.28394), randf_range(-0.0, 6.28394)))
