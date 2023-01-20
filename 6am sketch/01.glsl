// substract, min and max


float Circle(float r, float sr, vec2 uv, vec2 pos){
    return smoothstep(r, r - sr, length(uv - pos));
}

float Merge(float a, float b){

    return max(a, b);
}



void main(){
    vec2 uv = 2. *  gl_FragCoord.xy/iResolution.xy - 1.;
    uv.x *= iResolution.x/iResolution.y;
    
    // min, max
    // float circle1 = Circle(0.5, 0.3, uv, vec2(0.5,0.1));
    // float circle2 = Circle(0.5, 0.3, uv, vec2(-0.2,-0.1));
    // float merg1 = Merge(circle1, circle2);

    // float merg2 = Merge(merg1, Circle(0.2, 0.1, uv, vec2(-0.5,0.1)));

    float merge1;
    for(int i = 0; i < 10; i++){
        float circle2 = Circle(0.5, 0.45, uv, vec2(-0.2 * float(i),-0.1));

        merge1 = Merge(merge1,circle2);
    }
    vec3 color = vec3(merge1);

    gl_FragColor = vec4(color, 1.);
}