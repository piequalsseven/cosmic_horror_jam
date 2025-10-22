extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var open_door: AudioStreamPlayer = $OpenDoor
@onready var close_door: AudioStreamPlayer = $CloseDoor

@onready var transition: AudioStreamPlayer = $Transition
@onready var ending_layer: AudioStreamPlayer = $EndingLayer
@onready var end_sound: AudioStreamPlayer = $EndSound

var is_ending : bool
func _ready() -> void:
	music_player.play()
	

func _on_music_player_finished() -> void:
	music_player.play()

func _on_ending_layer_finished() -> void:
	if is_ending:
		ending_layer.play()
		
func play_open_door() -> void:
	open_door.pitch_scale = randf_range(.8, 1.2)
	open_door.play()
	
func play_close_door() -> void:
	open_door.pitch_scale = randf_range(.8, 1.2)
	close_door.play()

func transition_to_endingarea() -> void:
	if is_ending:
		return
	transition.play()
	await get_tree().create_timer(1).timeout
	ending_layer.play()
	music_player.pitch_scale = 2
	is_ending = true
	
func leaving_endingarea() -> void:
	if is_ending:
		is_ending = false
		music_player.stop()
		ending_layer.stop()
		end_sound.play()
		
		
func _on_end_sound_finished() -> void:
	get_tree().quit()
