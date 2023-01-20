


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


void main(){
     vec2 uv = 2. *  gl_FragCoord.xy/iResolution.xy - 1.;
    uv.x *= iResolution.x/iResolution.y;



    vec3 color = vec3(Rect(uv, -0.2, 0.2, -0.2, 0.2, 0.0002));


    gl_FragColor = vec4(color, 1.);
}