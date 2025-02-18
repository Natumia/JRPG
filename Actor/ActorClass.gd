class_name Actor
extends Node2D

const DAMAGE_NUMBER = preload("res://System/damage_number.tscn")

@export var status: Status

func attack(target_status: Status) -> void:
	if status and target_status:
		randomize()
		if hit_formula(target_status):
			damage(target_status) 

func damage(input_status: Status) -> void:
	input_status.health_current -= attack_formula(input_status)
	if input_status.health_current <= 0.0:
		input_status.get_parent().defeat()

func defeat() -> void:
	queue_free()

func hit_formula(input_status: Status) -> bool:
	var hit_roll = randf()
	if hit_roll < status.hit_rate - input_status.dodge_rate:
		return true
	print("Missed the target!")
	input_status.get_parent().spawn_damage_number("Miss!")
	return false

func attack_formula(input_status: Status) -> float:
	var damage_dealt = status.attack * randf_range(1.0 - status.attack_variance, 1.0 + status.attack_variance) - input_status.defense
	damage_dealt = roundi(damage_dealt)
	input_status.get_parent().spawn_damage_number(damage_dealt)
	print(str("Hit! ", damage_dealt, " damage dealt!"))
	return damage_dealt

func spawn_damage_number(input_damage) -> void:
	var new_number = DAMAGE_NUMBER.instantiate()
	new_number.global_position = global_position
	add_sibling(new_number)
	new_number.set_text(str(input_damage))
