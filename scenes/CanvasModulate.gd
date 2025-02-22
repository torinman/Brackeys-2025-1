extends CanvasModulate

var brightness = 255
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node(".").color = Color8(brightness, brightness, brightness)


func _on_area_2d_body_entered(body):
	print(brightness)
	while brightness > 25:
		brightness -= 1
		await get_tree().create_timer(0.005).timeout
