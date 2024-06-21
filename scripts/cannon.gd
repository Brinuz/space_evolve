extends Node2D

@export var spawn_locations: Array[Marker2D]
@export var projectile: PackedScene
@export var shooting_animation: AnimationPlayer

func fire_bullet(index: int):
	SignalBus.projectile_fired.emit(projectile, spawn_locations[index].global_position, global_rotation)

func _input(event):
	if event.is_action_pressed("shoot"):
		shooting_animation.play("shoot")
