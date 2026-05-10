extends Node

## save data
var money = 0 
var collected_coins = []  
var equipped_skin_id = 0 # 0 is default

## skin database
var skins = [
	{
		"name": "Default",
		"price": 0,
		"unlocked": true,
		"idle": preload("res://photos/Idle Proper Game Art.png"),
		"run": preload("res://photos/Proper Running Animation (1).png")
	},
	{
		"name": "Glitchy",
		"price": 1,
		"unlocked": false,
		"idle": preload("res://photos/alternate skin idle.png"),
		"run": preload("res://photos/alternate skin running.png") 
	}
]
