extends Node2D

@onready var area = $Area2D
@onready var sprite = $AnimatedSprite2D
@export var groop = "Laserers"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	for node in get_parent().get_node(groop).get_children():
		node.turn_on()
	sprite.play("down")


func _on_area_2d_body_exited(body):
	sprite.play("up")
	for node in get_parent().get_node(groop).get_children():
		node.turn_off()
