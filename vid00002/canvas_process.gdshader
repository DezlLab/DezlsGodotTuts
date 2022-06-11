shader_type canvas_item;

uniform sampler2D inputLayer;

uniform sampler2D rainNoise;

uniform vec2 rainDirection;
uniform vec2 screenPlayerPos;
uniform float playerRotation;
uniform vec2 playerBoxSize;
uniform vec2 playerPosPropagation;
uniform vec3 canvasChannelDegrade;
uniform float playerPosDiffusion;
uniform float canvasDiffusion;
//uniform float windStrenth;//~~TODO :]
//uniform sampler2D windNoise;

void fragment(){
	//update canvas
	vec3 canvas = textureLod(SCREEN_TEXTURE, SCREEN_UV + rainDirection, canvasDiffusion).xyz;
	canvas.x = textureLod(SCREEN_TEXTURE, vec2((SCREEN_UV) * playerPosPropagation) + (1.0 - playerPosPropagation) * 0.5, playerPosDiffusion).x;
	
	
	//new input 
	vec3 mainLayerColor = texture(inputLayer, SCREEN_UV * vec2(1.0, -1.0) + vec2(0.0, 1.0)).xyz;
	float rain = textureLod(rainNoise, SCREEN_UV * vec2(2.0, 0.01) + vec2(0.0, 0.1 * TIME) , 0.00).z * float(SCREEN_UV.y > 0.001 && SCREEN_UV.y < 0.01);
	
	rain = float(rain > 0.60); //make uniform
	vec2 playerPosUV = SCREEN_UV; //TODO make rotate
	float layerMask = float((mainLayerColor.x + mainLayerColor.y + mainLayerColor.z) < 0.5);
	float playerPos = float(screenPlayerPos.x > playerPosUV.x - playerBoxSize.x && screenPlayerPos.x < playerPosUV.x + playerBoxSize.x
	&& screenPlayerPos.y > playerPosUV.y - playerBoxSize.y && screenPlayerPos.y < playerPosUV.y + playerBoxSize.y
	);
	
	//COLOR = vec4(vec3(playerPosUV, 0.0), 1.0); //DEBUG Rain Spawn
	
	//combine canvas and input
	COLOR = vec4(vec3(playerPos, 0.0, rain) + canvas * canvasChannelDegrade * layerMask, 1.0);
	//TODO functions for different modes or other shader 
	
}