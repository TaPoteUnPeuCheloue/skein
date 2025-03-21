extends Node3D
const first_position :Vector3 = Vector3(4.0,8.0,4.0)
const squaresize: int = 8

const BlocScene = preload("res://pillar.tscn")

const matrix : Array = [
	{
		"begin":1, "cout": [7,1,8,3,1,2,7] 
	},
	{
		"begin":1, "cout": [1,5,1,1,2,2,2,2,1,1,1,1,1,1,1,5,1] 
	},
	{
		"begin": 1, "cout": [1,1,3,1,1,4,1,4,1,2,2,1,1,1,3,1,1]
	},
	{
		"begin": 1, "cout": [1,1,3,1,1,1,1,1,1,3,2,4,1,1,1,1,3,1,1]
	}, 
	{
		"begin": 1, "cout": [1,1,3,1,1,2,1,4,1,1,1,2,2,1,1,1,3,1,1]
	},
	{
		"begin": 1, "cout": [1,5,1,3,2,1,1,1,2,1,2,2,1,5,1]
	},
	{
		"begin": 1, "cout": [7,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,7]
	}, 
	{
		"begin": 0, "cout": [8,2,1,1,3,3,11]
	},
	{
		"begin": 1, "cout": [1,1,2,1,3,1,2,2,1,1,1,1,2,3,1,2,1,1,2]
	},
	{
		"begin": 0, "cout": [1,5,3,2,1,4,3,2,1,3,3,1] 
	},
	{
		"begin": 0, "cout": [1,3,1,5,3,1,2,2,3,1,1,1,2,2,1]
	},
	{
		"begin": 0, "cout": [4,2,1,3,2,1,3,1,4,3,4,1]
	},
	{
		"begin": 0, "cout": [1,1,4,2,1,3,2,2,4,2,1,1,1,2,2]
	},
	{
		"begin": 0, "cout": [1,1,1,1,4,1,3,1,1,1,1,3,3,1,3,3]
	},
	{
		"begin": 0, "cout": [1,10,2,1,1,3,1,1,1,1,1,1,2,3]
	},
	{
		"begin": 1, "cout": [3,1,1,2,4,1,1,1,1,1,1,1,2,1,4,2,1,1]
	},
	{
		"begin": 1, "cout": [5,1,1,2,3,2,6,1,1,2,2,1,1,1]
	},
	{
		"begin": 0, "cout": [1,1,1,1,6,3,1,1,1,2,1,2,2,1,1,3,1]
	},
	{
		"begin": 1, "cout": [1,1,1,1,1,1,1,1,1,2,1,1,6,1,2,1,1,2,1,2]
	},
	{
		"begin": 0, "cout": [2,1,8,1,1,2,2,1,1,1,2,1,1,1,1,1,2]
	},
	{
		"begin": 0, "cout": [1,1,1,2,1,4,1,1,1,2,1,1,1,1,1,7,2]
	},
	{
		"begin": 0, "cout": [8,4,3,2,2,2,3,5]
	},
	{
		"begin": 1, "cout": [7,1,1,1,2,2,2,1,1,2,1,1,1,1,2,1,1,1]
	}, 
	{
		"begin": 1, "cout": [1,5,1,1,3,1,4,2,1,1,1,3,2,2,1]
	},
	{
		"begin": 1, "cout": [1,1,3,1,1,4,1,4,1,1,1,1,5,1,1,1,1]
	},
	{
		"begin": 1, "cout": [1,1,3,1,1,1,1,2,1,7,1,1,1,1,3,1,1,1]
	},
	{
		"begin": 1, "cout": [1,1,3,1,1,1,2,1,1,2,1,2,2,1,1,2,1,2,1,1,1]
	},
	{
		"begin": 1, "cout": [1,5,1,3,3,2,1,1,2,1,1,2,3,1,1,1]
	},
	{
		"begin": 1, "cout": [7,1,3,6,2,1,2,1,3,1,1,1]
	}
	
	
]


func _ready() -> void:
	generate_walls()
	
func generate_walls() -> void: 
	for y_index in range(0, len(matrix)):
		var line = matrix[y_index]
		var current_state = line["begin"]
		var x_index = 0
		for cout in line["cout"]:
			var iterations = cout
			for i in range(0, iterations):
				if current_state:
					place_bloc(x_index, y_index)
				x_index = x_index + 1
			current_state = abs(current_state - 1)

func place_bloc(x: int, y: int) -> void:
	var bloc : Node3D = BlocScene.instantiate()
	bloc.position = first_position
	bloc.position.x = bloc.position.x + (8*x)
	bloc.position.z = bloc.position.z + (8*y)
	$Pillars.add_child(bloc)
