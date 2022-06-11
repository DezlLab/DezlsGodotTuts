shader_type canvas_item;

uniform sampler2D mainLayerMask;
uniform float rainMaskClip;
uniform float rainMaskBias;
uniform vec4 color : hint_color;

void fragment()
{
	vec3 mask = texture(mainLayerMask, UV).rgb;
	//float rainAlpha = float(mask.x + mask.y + mask.z < rainMaskClip);// old Clip version only clip
	//float rainAlpha = float(1.0 / ((mask.x + mask.y + mask.z ) * rainMaskBias + 1.0)); new version in development ¯\_(ツ)_/¯
	//rainAlpha *= float(rainAlpha > rainMaskClip);
	
	
	
	//COLOR = vec4(vec3(0, 0, 1) , float(canvas.z > 0.2) * canvas.z * rainAlpha);
	//COLOR = vec4(vec3(rainAlpha), 1.0);
	COLOR = vec4(color * mask.z);
}