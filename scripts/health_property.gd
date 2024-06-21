extends Node

class_name HealthProperty

@export var MAX_HP: int
var current_hp: int

func _ready():
	current_hp = MAX_HP

func take_damage(damage: int) -> int:
	current_hp -= damage
	
	print(current_hp)
	
	return current_hp
