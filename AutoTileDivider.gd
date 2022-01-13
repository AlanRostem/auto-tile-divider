tool
extends Control

const COLS = 5
#const ROWS = 3

export(Texture) var __tile_set: Texture setget __set_tile_set

func __set_tile_set(tex):
	__tile_set = tex
	var tile_set = $TileMap.tile_set
	for id in tile_set.get_tiles_ids():
		tile_set.tile_set_texture(id, __tile_set)
