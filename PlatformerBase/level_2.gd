extends Node

@export var key_resource : PackedScene
@export var chest_resource : PackedScene
@export var enemy_resource : PackedScene
@onready var mainmenu = preload("res://menu.tscn") as PackedScene
var keyVal = 0

func key_collected() -> void:
	keyVal += 1
	if keyVal > 0:
		var colKey = key_resource.instantiate()
		colKey.position = Vector2(-75,-91)
		add_child(colKey)
		
func chest_unlock():
	if keyVal == 1:
		get_tree().change_scene_to_packed(mainmenu)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var newChest = chest_resource.instantiate()
	newChest.position = Vector2(308,34)
	add_child(newChest)
	var newKey = key_resource.instantiate()
	newKey.position = Vector2(325,162)
	add_child(newKey)
	var newEnemy1 = enemy_resource.instantiate()
	newEnemy1.position = Vector2(426,150)
	add_child(newEnemy1)
	var newEnemy2 = enemy_resource.instantiate()
	newEnemy2.position = Vector2(169,55)
	add_child(newEnemy2)
