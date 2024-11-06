extends Node2D

@onready var level1 = load("res://level1.tscn") as PackedScene

func _on_buttonlevel_1_pressed() -> void:
	if level1 : 
		get_tree().change_scene_to_packed(level1)
