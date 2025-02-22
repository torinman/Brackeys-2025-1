extends AnimatedSprite2D
var once = 0

@export var nextlevel: String
@export var day: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if once == 0:
		Dialogic.timeline_ended.connect(_on_timeline_ended)
		Dialogic.start(day)
		once = 1

func _on_timeline_ended():
	get_tree().change_scene_to_file(nextlevel)
