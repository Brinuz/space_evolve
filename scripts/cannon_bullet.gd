extends CharacterBody2D
class_name WeaponProjectile

@export var base_speed: float = 300.0

func _physics_process(delta):
	velocity = calculate_velocity(base_speed)
	
	move_and_slide()
	
func calculate_velocity(speed_modifier) -> Vector2:
	return Vector2.UP.rotated(rotation) * speed_modifier
