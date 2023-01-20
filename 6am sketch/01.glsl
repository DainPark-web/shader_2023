


float Circle(float r, float sr, vec2 uv){

    return smoothstep(r, r - sr, length(uv));
}



void main(){
    vec2 uv = 2. *  gl_FragCoord.xy/iResolution.xy - 1.;
    uv.x *= iResolution.x/iResolution.y;
    

    vec3 color = vec3(Circle(0.5, 0.02, uv));

    gl_FragColor = vec4(color, 1.);
}