extends Sprite2D

@onready var color_rect: ColorRect = $ColorRect



func _process(delta: float) -> void:
	color_rect.color.a -= 0.005
