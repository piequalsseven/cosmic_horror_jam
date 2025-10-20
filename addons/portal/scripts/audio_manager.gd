extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var open_door: AudioStreamPlayer = $OpenDoor
@onready var close_door: AudioStreamPlayer = $CloseDoor

func _ready() -> void:
	music_player.play()

func _on_music_player_finished() -> void:
	music_player.play()

func play_open_door() -> void:
	open_door.pitch_scale = randf_range(.8, 1.2)
	open_door.play()
	
func play_close_door() -> void:
	open_door.pitch_scale = randf_range(.8, 1.2)
	close_door.play()
