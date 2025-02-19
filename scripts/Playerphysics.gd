extends CharacterBody2D


const ACCEL = 40.0
const JUMP_ACCEL = -30.0
const FRIC = 0.87
const AIR_FRIC = 0.89
const V_JUMP_DELAY = 0.1
const V_JUMP_START = -150
@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var since_ground = V_JUMP_DELAY

var push_force = 20.0

func _physics_process(delta):
	since_ground += delta
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if is_on_floor():
		since_ground = 0
	
	if Input.is_action_pressed("jump") and since_ground == 0:
		velocity.y = V_JUMP_START
	elif Input.is_action_pressed("jump") and since_ground <= V_JUMP_DELAY:
		velocity.y += JUMP_ACCEL
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x += direction * ACCEL
	if is_on_floor():
		velocity.x *= FRIC  
	else: 
		velocity.x *= AIR_FRIC

	
	if direction == 1:
		animated_sprite_2d.flip_h = false
	if direction == -1:
		animated_sprite_2d.flip_h = true
	
	if velocity.y < 0:
		animated_sprite_2d.play("jump")
	elif velocity.y > 0:
		animated_sprite_2d.play("fall")
	elif direction != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
