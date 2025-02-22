extends Node2D

@onready var ray = $RayCast2D
@onready var line = $Line2D
@onready var lab = $Label
var on = true
var on_start = on
# Called when the node enters the scene tree for the first time.
func _ready():
	line.points.clear()
	line.show()
	line.add_point(ray.position)
	line.add_point(ray.target_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if on:
		line.default_color = Color.CYAN
		if ray.is_colliding():
			var collider = ray.get_collider()
			var col_point = ray.get_collision_point()
			var local_col_point = to_local(col_point)
			lab.text = "collider: %s \n global point: %s \n local: %s" % [collider, col_point, local_col_point]
			line.points[1] = local_col_point
			if collider is CharacterBody2D:
				get_tree().reload_current_scene()
	else:
		line.default_color = Color.TRANSPARENT


func turn_on():
	on = not on_start

func turn_off():
	on = on_start
