extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sprite_2d = $Sprite2D
var is_ball = false

var SPEED = 600.0
var JUMP_VELOCITY = -300.0
var score = 0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("spacebar"):
		if is_ball:
			$AnimatedSprite2D.visible = true
			$Sprite2D.visible = false
			is_ball = false
			$CollisionShape2D.disabled = false
			SPEED = 600
			JUMP_VELOCITY = -300
		else:
			$AnimatedSprite2D.visible = false
			$Sprite2D.visible = true
			is_ball = true
			$CollisionShape2D.disabled = true
			SPEED += -350
			JUMP_VELOCITY += -500
#add jump animation

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
	if direction > -1:
		$AnimatedSprite2D.flip_h = false
		$Sprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
		$Sprite2D.flip_h = true
	if direction:
		$Sprite2D.rotate(0.15 * direction)
		






	move_and_slide()
