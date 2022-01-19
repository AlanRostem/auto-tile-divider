extends Control

export(Texture) var __tile_set: Texture setget __set_tile_set

onready var __view_port = $ViewportContainer/Viewport
onready var __save_dialog = $SaveDialog
onready var __open_dialog = $OpenDialog

func __set_tile_set(tile_set):
	__tile_set = tile_set
	#__update_tiles(tile_set)
	
func _ready():
	__open_dialog.popup()

func __save(path):
	var img = __view_port.get_texture().get_data()
	img.flip_y()
	img.save_png(path)
	
func __load(path):
	__update_tiles(load(path))
	
func __update_tiles(image):
	var tile_set = $ViewportContainer/Viewport/TileMap.tile_set
	for id in tile_set.get_tiles_ids():
		tile_set.tile_set_texture(id, image)

func _on_OpenDialog_file_selected(path):
	__load(path)
	__save_dialog.call_deferred("popup")

func _on_SaveDialog_file_selected(path):
	__save(path)
