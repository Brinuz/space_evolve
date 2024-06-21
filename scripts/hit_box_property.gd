extends Area2D

class_name HitBoxProperty

@export var health: HealthProperty

func _ready():
	connect("area_entered", _on_body_entered)

func _on_body_entered(body):
	if body is HitProperty:
		var hit: HitProperty = body
		
		hit.hit(self)
		health.take_damage(hit.damage)
