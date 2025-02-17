class_name Actor
extends Node2D

@export var status: Status

func attack(target_status: Status) -> void:
	if status and target_status:
		target_status.health_current -= status.attack_damage
