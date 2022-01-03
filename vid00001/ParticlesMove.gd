extends Node2D

export var nParticles = 300
var particles
var player : Node
var rect : Vector2

func _ready():
	particles = [$P0, $P1, $P2, $P3, $P4, $P5, $P6, $P7, $P8]
	player = get_node("/root/root/Player")
	rect = get_viewport().size

func _process(delta):

#	updatePosition(player.position, particles[0], rect, 2, Vector2(0, 1),  Vector2(0, 0)) ###2x2 Grid###
#	updatePosition(player.position, particles[1], rect, 2, Vector2(2, 1),  Vector2(2, 0))
#	updatePosition(player.position, particles[2], rect, 2, Vector2(0, -1), Vector2(0, -2)) ###Remove if only X
#	updatePosition(player.position, particles[3], rect, 2, Vector2(2, -1), Vector2(2, -2)) ###Remove if only X
	
	var changePlayerPos = -1
	updatePosition(player.position, particles[0], rect, 3, Vector2(0, 2 - changePlayerPos),  Vector2(0, 2)) ###3x3 Grid### (+1 for tile correct)
	updatePosition(player.position, particles[1], rect, 3, Vector2(2, 2 - changePlayerPos),  Vector2(2, 2))
	updatePosition(player.position, particles[2], rect, 3, Vector2(-2, 2- changePlayerPos), Vector2(-2, 2))
	updatePosition(player.position, particles[3], rect, 3, Vector2(0, 0 - changePlayerPos),  Vector2(0, 0)) ###
	updatePosition(player.position, particles[4], rect, 3, Vector2(2, 0 - changePlayerPos),  Vector2(2, 0))
	updatePosition(player.position, particles[5], rect, 3, Vector2(-2, 0- changePlayerPos), Vector2(-2, 0))
	updatePosition(player.position, particles[6], rect, 3, Vector2(0, -2- changePlayerPos),  Vector2(0, -2)) ###
	updatePosition(player.position, particles[7], rect, 3, Vector2(2, -2- changePlayerPos),  Vector2(2, -2))
	updatePosition(player.position, particles[8], rect, 3, Vector2(-2, -2-changePlayerPos), Vector2(-2, -2))


func updatePosition(x, node, stepSize, gridSize, xStepOff, yStepOff):
	xStepOff *= stepSize
	yStepOff *= stepSize
	stepSize *= gridSize * 2
	node.position = _round((x - xStepOff) / stepSize) * stepSize + yStepOff

func _round(vec : Vector2) -> Vector2:
	vec.x = round(vec.x)
	vec.y = round(vec.y)
	return vec
