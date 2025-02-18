extends Node2D

var turn_order: Array = []

func _on_attack_left_pressed() -> void:
	$DebugActor.attack($DebugActor2.status)

func _on_attack_right_pressed() -> void:
	$DebugActor2.attack($DebugActor.status)

func _ready() -> void:
	for i in get_children(true):
		if i.has_node("Status"):
			turn_order.append(i)
	turn_order.sort_custom(compare_speed)

func compare_speed(a, b) -> bool:
	if a.status.speed < b.status.speed:
		return true
	return false

func _on_timer_timeout() -> void:
	if $DebugActor2 and $DebugActor:
		$DebugActor.attack($DebugActor2.status)
		$DebugActor2.attack($DebugActor.status)
