extends CharacterBody2D

const BASE_SPEED = 50.0
const ROTATION_BASE_SPEED = 200.0

@export var engine_animation: AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_axis("turn_left", "turn_right")
	var speed_modifier = speed_modifier()
	
	rotation = calculate_rotation(direction, delta)
	velocity = calculate_velocity(speed_modifier)

	move_and_slide()

func _input(event):
	if event.is_action_pressed("slow_down"):
		engine_animation.animation = "slow"
		
	if event.is_action_pressed("speed_up"):
		engine_animation.animation = "boost"
		
	if event.is_action_released("speed_up") or event.is_action_released("slow_down"):
		engine_animation.animation = "idle"

func calculate_rotation(direction: float, delta: float) -> float:
	if direction != 0.0:
		return lerp_angle(rotation, rotation + deg_to_rad(direction), delta * ROTATION_BASE_SPEED)
	return rotation

func calculate_velocity(speed_modifier) -> Vector2:
	return Vector2.UP.rotated(rotation) * speed_modifier
	
func speed_modifier() -> float:
	if Input.is_action_pressed("speed_up"):
		return BASE_SPEED * 2.0
		
	if Input.is_action_pressed("slow_down"):
		return BASE_SPEED * 0.5
		
	return BASE_SPEED

