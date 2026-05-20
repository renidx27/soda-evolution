extends TextureButton

@onready var score_label = $"../Score" 
@onready var original_scale = scale


var water = preload("res://Sprites/water.jpg")
var nataxtari = preload("res://Sprites/nataxtari.jpg")
var limonad = preload("res://Sprites/limonad.jpg")
var flay = preload("res://Sprites/flay.jpg")
var sok = preload("res://Sprites/sok.jpg")
var babl_tea = preload("res://Sprites/babl_tea.jpg")
var freakshake = preload("res://Sprites/freakshake.jpg")
var maxuto = preload("res://Sprites/maxuto.png")

func _ready():
	pass

	if score_label:
		score_label.text = str(GameData.score)
		evolution()
	var bg_node = $"../BackgroundSprite"
	if bg_node:
		bg_node.texture = load(GameData.current_background)

func _on_pressed():
	GameData.score += GameData.click_power
	score_label.text = str(GameData.score)
	evolution()
	animation()
	bulk_spawn()

func evolution():
	if GameData.score >= 10000:
		texture_normal = maxuto
	elif GameData.score >= 5000:
		texture_normal = freakshake
	elif GameData.score >= 2500:
		texture_normal = babl_tea
	elif GameData.score >=1000:
		texture_normal = sok
	elif GameData.score >= 500:
		texture_normal = flay
	elif GameData.score >= 200:
		texture_normal = limonad
	elif GameData.score >= 100:
		texture_normal = nataxtari
	elif GameData.score >= 50:
		texture_normal = water

func animation():
	var tween = create_tween()
	tween.tween_property(self, "scale", original_scale * 0.9, 0.05)
	tween.tween_property(self, "scale", original_scale, 0.1)


func bulk_spawn():
	var label = Label.new()
	label.text = "Бульк!!"
	label.modulate = Color("0000ffff")
	label.add_theme_font_size_override("font_size", 24)
	var click_position = get_global_transform() * get_local_mouse_position()
	label.position = click_position - Vector2(20, 10)
	get_parent().add_child(label)
	var spawn_tween = create_tween().set_parallel(true)
	spawn_tween.tween_property(label, "position:y", label.position.y - 80, 0.4)
	spawn_tween.tween_property(label, "modulate:a", 0.0, 0.4)
	spawn_tween.chain().tween_callback(label.queue_free)


func _on_storelink_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/store.tscn")
