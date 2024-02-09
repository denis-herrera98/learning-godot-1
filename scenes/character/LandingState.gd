extends State

@export var ground_state: State

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "jump_end" and character.is_on_floor():
		next_state = ground_state

func state_process(delta):
	if character.is_on_floor():
		next_state = ground_state
