class_name HealthBar
extends ProgressBar

@export var status: Status

func _process(_delta: float) -> void:
	if status:
		max_value = status.health_max
		value = status.health_current
