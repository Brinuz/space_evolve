extends Node2D

func _ready():
	SignalBus.projectile_fired.connect(_on_projectile_fired_spawn)
	
func _on_projectile_fired_spawn(projectile: PackedScene, position: Vector2, direction: float):
	print("Spawning projectile!")
	
	var root = get_tree().root
	var current_scene = root.get_child(root.get_child_count() - 1)
		
	var node = projectile.instantiate()
	node.rotation = direction
	node.position = position
	current_scene.add_child(node)
