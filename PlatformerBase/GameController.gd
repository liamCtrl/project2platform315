extends Node

@export var key_resource : PackedScene
@export var chest_resource : PackedScene
@export var enemy_resource : PackedScene
@onready var level2 = preload("res://level2.tscn") 
var keyVal = 0

func key_collected() -> void:
	keyVal += 1
	if keyVal > 0:
		var colKey = key_resource.instantiate()
		colKey.position = Vector2(-75,-91)
		add_child(colKey)
		
func chest_unlock() -> void:
	#get_tree().change_scene_to_packed(level2)
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var newChest = chest_resource.instantiate()
	newChest.position = Vector2(44.5,153)
	add_child(newChest)
	var newKey = key_resource.instantiate()
	newKey.position = Vector2(325,-28)
	add_child(newKey)
	var newEnemy1 = enemy_resource.instantiate()
	newEnemy1.position = Vector2(264,99)
	add_child(newEnemy1)
	var newEnemy2 = enemy_resource.instantiate()
	newEnemy2.position = Vector2(392.5,-25.5)
	add_child(newEnemy2)
