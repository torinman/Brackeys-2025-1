extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Sprite2D").scale *= 1.015
	get_node("Sprite2D").scale += Vector2(0.001, 0.001)
