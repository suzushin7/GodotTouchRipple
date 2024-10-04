extends Node2D

var ripple_scene: PackedScene = preload("res://Scenes/Ripple.tscn")

# タッチイベントの処理
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		spawn_ripple(event.position)
	elif event is InputEventMouseButton and event.is_pressed():
		spawn_ripple(event.position)

func spawn_ripple(pos: Vector2) -> void:
	var ripple: Node = ripple_scene.instantiate()
	ripple.position = pos
	add_child(ripple)
