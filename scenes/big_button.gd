extends Node2D

@onready var area = $Area2D
@onready var sprite = $AnimatedSprite2D
@export var groop = "Laserers"
@export var credits: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	sprite.play("down")
	await get_tree().create_timer(1).timeout
	for node in get_parent().get_node(groop).get_children():
		node.toggle()
	get_parent().get_node("BIG JAR/AnimatedSprite2D").play("BREAK")
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_packed(credits)
