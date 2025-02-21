extends Node2D

@export var nextlevel: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func switch_level():
	get_tree().change_scene_to_file(nextlevel)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		


func _on_jar_tree_exiting():
	print("byebye!")
