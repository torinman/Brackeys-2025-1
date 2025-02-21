extends Node2D

@export var scentetoinstantiate: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass #queue_redraw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func smash():
	var new_scene = scentetoinstantiate.instantiate()
	new_scene.position = get_node("./Jar").position + get_node(".").position + Vector2(0, -5)
	new_scene.rotation = get_node("./Jar").rotation + get_node(".").rotation
	new_scene.get_children()[-1].emitting = true
	add_sibling(new_scene)
	queue_free()


func _on_body_entered(body):
	if body.name == "bigbox":
		smash()
