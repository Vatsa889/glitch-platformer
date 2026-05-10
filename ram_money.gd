extends Area2D

var unique_id : String

func _ready():
	# generates a unique ID for this specific coin
	# This uses the coin's position in the scene tree (example: "Level1/RAMs/RAM_Stick_3")
	unique_id = str(get_path())
	
	# check if this specific coin is already in our list
	if unique_id in Global.collected_coins:
		# if yes, delete it immediately before the player sees it
		queue_free()
		return

	# if not collected yet, connect the signal
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		# adds money
		Global.money += 1
		print("downloaded some RAM, new total: " + str(Global.money))
		visible = false  # Hide it so it looks collected
		$CollisionShape2D.set_deferred("disabled", true) # Stop collecting it twice
		$PickupSound.play() # <--- Play the sound
		await $PickupSound.finished # <--- Wait for it to end
		queue_free() # NOW delete it
		# save this coin's ID to the Global list so it doesn't spawn again
		Global.collected_coins.append(unique_id)
		
		queue_free()
