shader_type canvas_item; 

uniform vec4 target_color : source_color; 
uniform float tolerance : hint_range(0.0, 5.0); 
uniform vec4 modul : source_color; 

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV); 
    float dist = distance(tex_color , target_color);

    if (dist < tolerance) {
        tex_color.a = 0.0;
    }

    COLOR = tex_color*modul;
}