shader_type canvas_item;

uniform sampler2D space;
void fragment() {
	//whatever goes in here is the same thing that'll go on the regular floor plus some distortion
	vec4 color = texture(space,vec2(SCREEN_UV.x,SCREEN_UV.y+sin(SCREEN_UV.x*64.0+TIME*2.0)*0.03));
	color+=texture(space,SCREEN_UV)*0.5;
	COLOR = color;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
