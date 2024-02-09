extends CharacterBody2D

@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var _animation_tree : AnimationTree  = $AnimationTree

const WALK_SPEED = 200
const GRAVITY = 200.0

func _ready():
	_animation_tree.active = true

func process(delta: float):
	update_animation_parameters()

func _physics_process(delta: float):
	velocity.y += delta * GRAVITY
	
	var direction = Input.get_axis("left", "right")
	var is_attacking = _animated_sprite.get_animation() == "attack_rigth" || _animated_sprite.get_animation() == "attack_left"
	var is_playing_animation = _animated_sprite.is_playing()

	print(_animated_sprite.get_animation())

	print(direction)
	
	if direction == 1:
		_animated_sprite.flip_h = false 
	elif direction == -1:
		_animated_sprite.flip_h = true

# Input.is_action_just_pressed("attack"):
	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0

#	if _animated_sprite.flip_h:
#		print('SHOULD ATTACK LEFT')
#	else:
#		print('SHOULD ATTACK RIGHT')
#

	move_and_slide()

func update_animation_parameters():
	if velocity == Vector2.ZERO:
		_animation_tree["parameters/conditions/is_idle"] = true 
		_animation_tree["parameters/conditions/is_running"] = false
	else: 
		_animation_tree["parameters/conditions/is_idle"] = false 
		_animation_tree["parameters/conditions/is_running"] = true

##	_animation_tree["parameters/conditions/is_attacking_l"]
##	_animation_tree["parameters/conditions/is_attacking_r"]
##	_animation_tree["parameters/conditions/is_idle"]
##	_animation_tree["parameters/conditions/is_running"]
