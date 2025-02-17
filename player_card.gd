@tool
extends VBoxContainer

signal actor_changed

@export var actor_resource: Actor:
	set(input):
		actor_resource = input
		actor_changed.emit()

func _process(_delta: float) -> void:
	if actor_resource:
		$TextureRect.texture = actor_resource.sprite
		$Label.text = actor_resource.name
		$Label2.text = str(actor_resource.health)

func _on_actor_changed() -> void:
	if actor_resource:
		$TextureRect.texture = actor_resource.sprite
		$Label.text = actor_resource.name
		$Label2.text = str(actor_resource.health)
	else:
		$TextureRect.texture = null
		$Label.text = "No Actor Present"
		$Label2.text = ""
