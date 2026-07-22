extends Control

# Update "res://main.tscn" to match the path of your game level scene!
@export_file("*.tscn") var level_scene_path: String = "res://main.tscn"

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(level_scene_path)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
