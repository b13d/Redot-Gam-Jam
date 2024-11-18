shader_type canvas_item;

void vertex() {
	//VERTEX += vec2(cos(TIME) * 100.0, sin(TIME) * 100.0);
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
	//COLOR.a = clamp(cos(TIME), 0.0, 1.0);
	//COLOR.b = cos(TIME) * blue;
}