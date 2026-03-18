extends Area2D

@export var target_scene: PackedScene
@export var spawn_name: String = ""

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if not body.is_in_group("player"):
		return
	
	if target_scene == null:
		push_warning("Door has no target scene assigned.")
		return
	
	get_tree().change_scene_to_packed(target_scene)
