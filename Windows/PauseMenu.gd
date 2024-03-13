extends CanvasLayer

@onready var camera2D = $"../"
@onready var settings_menu = $Pages/Settings
@onready var savings_menu = $Pages/Savings

signal save_requested(save_name : String)

func _on_resume_pressed():
	resume_game()


func _on_quit_game_pressed():
	get_tree().quit()


func _on_finish_game_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Windows/MainMenu.tscn")


func _on_settings_pressed():
	settings_menu.show()

func resume_game():
	hide()
	get_tree().paused = false


func _on_load_pressed():
	savings_menu.update_saves_list()
	savings_menu.show()


func _on_savings_save_requested(save_name : String):
	save_requested.emit(save_name)

