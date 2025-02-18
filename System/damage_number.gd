extends Marker2D

@onready var damage_label: Label = $DamageLabel

var velocity: Vector2 = Vector2(0, 224)

func _ready() -> void:
	velocity.x = randf_range(-120, 120)

func _process(delta: float) -> void:
	position -= velocity * delta

func set_text(input_string) -> void:
	damage_label.text = input_string

func _on_timer_timeout() -> void:
	queue_free()
