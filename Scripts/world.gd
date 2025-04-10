extends Node2D
class_name World

var mapSize: Array = [9, 9]
var map: Array

var horizontalOffset: int = 75
var verticalOffset: int = 75
var tileSize: int = 75

var emptyTile: PackedScene
var playerScene: PackedScene
var player: Player

var playerStartPosition = [4,7]

func _init():
	emptyTile = load("res://Scenes/empty_tile.tscn")
	playerScene = load("res://Scenes/player.tscn")
	
	initialize_map()
	create_map_tiles()
	
	create_player()

func initialize_map():
	map = []
	for x in range(mapSize[0]):
		var row = []
		row.resize(mapSize[1])
		row.fill(0)
		map.append(row)

func create_map_tiles():
	for x in range(map.size()):
		for y in range(map[0].size()): 
			var newTile = emptyTile.instantiate()
			newTile.position.x = (x * tileSize) + horizontalOffset
			newTile.position.y = (y * tileSize) + verticalOffset
			add_child(newTile)

func create_player():
	player = playerScene.instantiate()
	player.world = self
	player.position.x = (playerStartPosition[0] * tileSize) + horizontalOffset
	player.position.y = (playerStartPosition[1] * tileSize) + verticalOffset
	map[playerStartPosition[0]][playerStartPosition[1]] = 3
	add_child(player)

func checkMoveTile(direction: String) -> void:
	print(direction)
