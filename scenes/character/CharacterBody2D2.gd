extends CharacterBody2D

@onready var _animation_tree : AnimationTree  = $AnimationTree
@onready var sprite: Sprite2D  = $Sprite2D
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine 

const WALK_SPEED = 200
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	_animation_tree.active = true

func _physics_process(delta: float):

	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = Input.get_axis("left", "right")
	update_animation_parameters(direction)

	# Input.is_action_just_pressed("attack"):

#	if _animated_sprite.flip_h:
#		print('SHOULD ATTACK LEFT')
#	else:
#		print('SHOULD ATTACK RIGHT')
#

	move(direction)
	update_facing_direction(direction)
	move_and_slide()

func move(direction):
	if direction != 0 && state_machine.check_if_can_move():
		velocity.x = direction * WALK_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)

func update_facing_direction(direction: float):
	if direction == 1:
		sprite.flip_h = false 
	elif direction == -1:
		sprite.flip_h = true

func update_animation_parameters(direction: float):
	_animation_tree.set("parameters/running/blend_position", direction)
