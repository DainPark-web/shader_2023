// substract, min and max

#include "./assets/lib.glsl" 

float Circle(float r, float sr, vec2 uv, vec2 pos){
    return smoothstep(r, r - sr, length(uv - pos));
}

float Merge(float a, float b){

    return max(a, b);
}


void main(){
    vec2 uv = 2. *  gl_FragCoord.xy/iResolution.xy - 1.;
    uv.x *= iResolution.x/iResolution.y;
    
    float merge1;
    for(int i = 0; i < 50; i++){
        float circle2 = Circle(random(vec2(i, i + 3)) * 0.7, 0.48, uv, 
            vec2(
                (random(vec2(float(i - 1), float(i + 1))) - 0.5) * 2. + sin(iTime + float(i) + random(vec2(i, i))), 
                (random(vec2(float(i), float(i))) - 0.5) * 2. + cos(iTime + float(i) + random(vec2(i + 1, i + 3)))
                )
            );
        merge1 = Merge(merge1,circle2);
    }
    vec3 color = vec3(merge1);

    color.x = color.x * 0.8;

    gl_FragColor = vec4(0.1/color, 1.);
}