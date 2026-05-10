extends Control

@onready var grid = $GridContainer
@onready var money_label = $MoneyLabel
@onready var skin_preview = $SkinPreview

func _ready():
	update_money_text()
	create_shop_buttons()
	
	# loads the first skin
	var current_skin = Global.skins[Global.equipped_skin_id]
	skin_preview.texture = current_skin["idle"]

# sprite animation
func _process(_delta):
	# only animate if we have a texture
	if skin_preview.texture != null:
		var total_frames = skin_preview.hframes
		
		# Change 150 to 150.0 (Float) to stop the warning
		var animation_speed = 150.0 
		
		# divides by float then becomes int again
		var current_frame = int(Time.get_ticks_msec() / animation_speed) % total_frames
		
		skin_preview.frame = current_frame

func update_money_text():
	money_label.text = "Cash: $" + str(Global.money)

func create_shop_buttons():
	for child in grid.get_children():
		child.queue_free()
	
	for i in range(Global.skins.size()):
		var btn = Button.new()
		
		btn.flat = true  
		btn.custom_minimum_size = Vector2(100, 100)
		btn.pressed.connect(_on_button_pressed.bind(i))
		grid.add_child(btn)
		update_button_visuals(btn, i)

func update_button_visuals(btn, index):
	var skin = Global.skins[index]
	
	if index == Global.equipped_skin_id:
		btn.text = skin["name"] + "\n(Equipped)"
		btn.modulate = Color.GREEN
	elif skin["unlocked"]:
		btn.text = skin["name"] + "\n(Owned)"
		btn.modulate = Color.WHITE
	else:
		btn.text = skin["name"] + "\n$" + str(skin["price"])
		btn.modulate = Color.RED

func _on_button_pressed(index):
	var skin = Global.skins[index]
	
	# Update the preview texture
	skin_preview.texture = skin["idle"]
	if skin["unlocked"]:
		Global.equipped_skin_id = index
	elif Global.money >= skin["price"]:
		Global.money -= skin["price"]
		skin["unlocked"] = true
		Global.equipped_skin_id = index
		update_money_text()
		
	create_shop_buttons()
	
func _on_leave_btn_pressed():
	get_tree().change_scene_to_file("res://level_select.tscn")
