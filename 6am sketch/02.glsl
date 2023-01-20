


float Band(float uvX, float start, float end, float blur ){
    float t = smoothstep(start - blur, start + blur, uvX);
    float tt = smoothstep(end + blur, end - blur, uvX);
    return t * tt;
}

float Rect(vec2 uv, float left, float right, float bottom, float top, float blur){
    float h = Band(uv.x, left, right, blur);
    float v =  Band(uv.y, bottom, top, blur);


    return h * v;
}

float Merge(float a, float b){


    return max(a, b);
}


void main(){
     vec2 uv = 2. *  gl_FragCoord.xy/iResolution.xy - 1.;
    uv.x *= iResolution.x/iResolution.y;


    float f = 0.;
    vec3 color = vec3(f);
    for(int i = 0; i < 20; i++){
        float v = (float(i) * 1.);
        float r =  Rect(uv, -2., 2., - 0.005 + sin(iTime + (uv.x * v)) * (v * 0.05), 0.005 + sin(iTime + (uv.x * v)) * (v * 0.05), abs(uv.x * 0.04) + 0.0001);
        f = Merge(f, r);
    }
    color = vec3(f);

    gl_FragColor = vec4(color, 1.);
}