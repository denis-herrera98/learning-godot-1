extends State

@export var ground_state: State
@export var landing_state: State

func state_process(delta):

	if character.is_on_floor():
		next_state = landing_state

