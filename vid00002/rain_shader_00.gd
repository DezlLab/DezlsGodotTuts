extends Node2D

func _ready():
	print($Viewport4/ColorRect2.material.get_shader_param("playerPosPropagation"))

func _input(event):
	if event is InputEventMouseButton && event.pressed:
		if event.button_index == 1:
			var pos = get_global_mouse_position()#Because 2px 0.5 and -0.25 click in middle => now not working
			pos = $Viewport/Node2D/Player.position / 64
			print(pos)
			$Viewport/Node2D/RealMainLayer.set_cell(pos.x, pos.y, 0, false, false, true)
		else:
			$Viewport/Node2D/Player/Sprite.frame = 1 - $Viewport/Node2D/Player/Sprite.frame #Switch


func _on_HSlider_value_changed(value):
	print("changeShader", value)
	#$Viewport4/ColorRect2.material.set_shader_param("playerPosPropagation", value)
	#$Viewport4/ColorRect2.material.set_shader_param("playerPosDiffusion", value)
	#$Viewport4/ColorRect2.material.set_shader_param("playerPosPropagation", Vector2(value, value))
	$Viewport4/ColorRect2.material.set_shader_param("canvasChannelDegrade", Vector3(value, 0.0, value))
