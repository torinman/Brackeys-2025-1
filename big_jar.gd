extends Node2D

@export var scenetoinstantiate: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animated_sprite_2d_animation_finished():
	var new_scene = scenetoinstantiate.instantiate()
	new_scene.position = Vector2(320, 180)
	new_scene.get_children()[0].emitting = true
	add_sibling(new_scene)
