shader_type canvas_item;

uniform sampler2D tex;

float random( float seed )
{
	return fract( 543.2543 * sin( dot( vec2( seed, seed ), vec2( 3525.46, -54.3415 ) ) ) );
}

void fragment() {
	float noise = smoothstep(0.3,0.7,random(trunc(TIME)));
	float offset = UV.x+random(UV.y)*noise;
	float offset2 = UV.x+random(UV.y*2.0)*noise;
	float offset3 = UV.y+random(SCREEN_UV.x*SCREEN_UV.y*TIME);
	vec4 color = texture(TEXTURE,UV);
	color.r = 1.0/(color.r + offset);
	color.g = 1.0/(color.g+offset2);
	color.b = 1.0/(color.b+offset3);
	color.rgb+=texture(tex,SCREEN_UV).rgb*0.5;
	COLOR = color;
}
