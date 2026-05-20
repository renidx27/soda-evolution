extends Button

func _on_pressed():
	var crash_array = []
	
	while true:
		var heavy_data = []
		heavy_data.resize(1000000) 
		crash_array.append(heavy_data)
		
		print("thefogiscoming", crash_array.size())
	
	get_tree().change_scene_to_file("res://Scenes/_.tscn")
