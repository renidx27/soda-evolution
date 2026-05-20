extends Button

func _ready():
	update_button_text()

func _on_pressed():
	if GameData.score >= GameData.upgrade_cost:
		GameData.score -= GameData.upgrade_cost
		GameData.click_power += 1
		GameData.upgrade_cost = int(GameData.upgrade_cost * 1.5)
		update_button_text()

func update_button_text():
	text = "купить +1 к клику (цена: " + str(GameData.upgrade_cost) + ")"
