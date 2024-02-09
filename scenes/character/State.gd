extends Node


class_name State

@export var can_move: bool = true
@export var next_state : State
var character: CharacterBody2D
var playback: AnimationNodeStateMachinePlayback

func state_process(delta):
	pass

func state_input(event: InputEvent):
	pass

func on_exit():
	pass

func on_enter():
	pass
