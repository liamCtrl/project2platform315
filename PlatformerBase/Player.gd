extends CharacterBody2D

var is_jumping = false

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if abs(velocity.x) > .1 and $PlayerAnimatedSprite2D.animation != "run":
		$PlayerAnimatedSprite2D.play("run")
	elif abs(velocity.x) < .1 and $PlayerAnimatedSprite2D.animation != "idle":
		$PlayerAnimatedSprite2D.play("idle")
		
	if(velocity.x > 0):
		$PlayerAnimatedSprite2D.scale.x = 1
	elif (velocity.x < 0):
		$PlayerAnimatedSprite2D.scale.x = -1

	if is_jumping and $PlayerAnimatedSprite2D.animation != "jump":
		$PlayerAnimatedSprite2D.play("jump")
		
func _physics_process(delta):
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		is_jumping = true
	else:
		is_jumping = false
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
