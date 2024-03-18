shader_type canvas_item;

uniform float intensity : hint_range(0, 10);
uniform vec2 rel_rect_size = vec2(1024, 600);
float distFromCen(vec2 p) {
	return distance(p, vec2(0.5));
}
//rotates by angle radians
vec2 rotate(vec2 p, float angle){
	return vec2(cos(angle)*p.x-sin(angle)*p.y, sin(angle)*p.x + cos(angle)*p.y);
	}

void fragment() {
	vec4 c = COLOR;
	
	float distMod = distFromCen(UV);
	float angle = intensity * distMod * 6.28318 + TIME;
	vec2 newp = rotate(UV-vec2(0.5), angle) + vec2(0.5);
	vec2 disp = (newp - UV) * rel_rect_size * SCREEN_PIXEL_SIZE;
	disp.y = -disp.y; // for some reason UV and SCEEN_UV are inveresed
	COLOR = mix(texture(TEXTURE, UV + disp), c, (0.5-distFromCen(UV)));
	COLOR.w =1.0 -  pow((distFromCen(UV)) / 0.5,10);
	
}
