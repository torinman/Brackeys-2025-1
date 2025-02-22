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
	get_node("AudioStreamPlayer2D").play()
	await get_tree().create_timer(1.8).timeout
	for node in get_parent().get_node(groop).get_children():
		node.toggle()
	await get_tree().create_timer(1).timeout
	get_node("AudioStreamPlayer2D2").play()
	get_parent().get_node("BIG JAR/AnimatedSprite2D").play("BREAK")
	await get_tree().create_timer(8).timeout
	get_tree().change_scene_to_packed(credits)
