extends Button


var new_bg_path = "res://Sprites/space.jpg" 

func _ready():
	update_button_text()

func _on_pressed():
	if GameData.is_space_bg_bought:
		GameData.current_background = new_bg_path
		update_button_text()
		return


	if GameData.score >= GameData.space_bg_cost:
		GameData.score -= GameData.space_bg_cost
		GameData.is_space_bg_bought = true
		GameData.current_background = new_bg_path
		update_button_text()


func update_button_text():
	if GameData.is_space_bg_bought:
		if GameData.current_background == new_bg_path:
			text = "Фон установлен"
			disabled = true
			text = "Включить Космический фон"
			disabled = false
	else:
		text = "Купить Космо-фон (Цена: " + str(GameData.space_bg_cost) + ")"
