extends AnimatedSprite2D
var once = 0
@onready var animated_sprite_2d = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if once == 0:
		Dialogic.start("day3")
		once = 1


