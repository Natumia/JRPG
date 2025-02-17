extends Control

@onready var player_card: VBoxContainer = $PlayerCard
@onready var enemy_card: VBoxContainer = $EnemyCard

func _on_attack_button_pressed() -> void:
	randomize()
	var attack_chance = randf()
	print(attack_chance)
	if attack_chance <= player_card.actor_resource.hit_chance:
		enemy_card.actor_resource.health -= player_card.actor_resource.damage
		if enemy_card.actor_resource.health <= 0:
			enemy_card.actor_resource = null
	else:
		print("miss")

func attack_function() -> void:
	pass
