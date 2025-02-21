shader_type canvas_item;

uniform vec3 adjust;
uniform vec3 offset;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(texture(TEXTURE, vec2(UV[0]+adjust[0]*sin(UV[1]*6.28394+offset[0]), UV[1]))[0], texture(TEXTURE, vec2(UV[0]+adjust[1]*sin(UV[1]*6.28394+offset[1]), UV[1]))[1], texture(TEXTURE,  vec2(UV[0]+adjust[2]*sin(UV[1]*6.28394+offset[2]), UV[1]))[2], ((texture(TEXTURE, vec2(UV[0]+adjust[0]*sin(UV[1]*6.28394+offset[0]), UV[1]))[0]+texture(TEXTURE, vec2(UV[0]+adjust[1]*sin(UV[1]*6.28394+offset[1]), UV[1]))[1]+texture(TEXTURE,  vec2(UV[0]+adjust[2]*sin(UV[1]*6.28394+offset[2])))[2]-0.2)*10.0));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
