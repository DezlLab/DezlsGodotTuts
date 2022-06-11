extends RigidBody2D

var speed = Vector2(300, 150)
var maxSpeed = Vector2(600, 200)


func _process(delta):
	var pos = Vector2(0, 0)
	if Input.is_action_pressed("ui_left"):
		pos.x -= 1
	if Input.is_action_pressed("ui_right"):
		pos.x += 1
	if Input.is_action_pressed("ui_down"):
		pos.y += 1
	if Input.is_action_pressed("ui_up"):
		pos.y -= 1
	if maxSpeed > self.linear_velocity && -maxSpeed < self.linear_velocity:
		self.apply_central_impulse(pos * speed)
