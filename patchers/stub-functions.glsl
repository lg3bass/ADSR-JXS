//FUNCTIONS
//========================================================================================
#define PI 3.1459265358979
#define TWO_PI 6.28318530718
#define TAU PI * 2.0


float linearstep(float begin, float end, float t) {
    return clamp((t - begin) / (end - begin), 0.0, 1.0);
}

float stroke(float x, float s, float w){
	float d = step(s, x+w * 0.5) - step(s, x - w * 0.5);
	return clamp(d,0.0,1.0);
}
	
float fill(float x, float size){
	return 1.0 - step(size, x);
}

float flip(float v, float pct){
	return mix(v,1.0-v,pct);
}

float circleSDF(vec2 st){
	return length(st-0.5)*2.0;
}

float raysSDF(vec2 st, int N){
	st -= 0.5;
	return fract(atan(st.y,st.x)/TAU*float(N));
}

float rectSDF(vec2 st, vec2 s) {
    st = st*2.-1.;
    return max( abs(st.x/s.x),
                abs(st.y/s.y) );
}

float hexSDF(vec2 st) {
    st = abs(st*2.-1.);
    return max(abs(st.y), st.x * 0.866025 + st.y * 0.5);
}

float polySDF(vec2 st, int V) {
    st = st*2.-1.;
    float a = atan(st.x,st.y)+PI;
    float r = length(st);
    float v = TAU/float(V);
    return cos(floor(.5+a/v)*v-a)*r;
}


void rotateShape(inout vec2 _st, float a){
	_st = mat2( cos(a) , -sin(a), sin(a), cos(a) ) * (_st - 0.5);
	_st += 0.5;
}

vec2 rotate(vec2 st, float a){
	st = mat2( cos(a) , -sin(a), sin(a), cos(a) ) * (st - 0.5);
	return st + 0.5;
}

mat2 scale(vec2 _scale){
    return mat2(_scale.x,0.0,0.0,_scale.y);
}

float sinc( float x, float k){
    float a = PI*(k*x-1.0);
    return sin(a)/a;
}

//source: https://www.iquilezles.org/www/articles/functions/functions.htm
float pcurve( float x, float a, float b , float amp)
{
    float k = pow(a+b,a+b) / (pow(a,a)*pow(b,b));
    
    float curve = k * pow( x, a ) * pow( 1.0-x, b );
    return curve * amp;
}


//source: https://www.iquilezles.org/www/articles/functions/functions.htm
float expImpulse( float x, float k ){
	float h = k*x;
    return h*exp(0.0005-h);
}

float gain(float x, float k) 
{
    float a = 0.5*pow(2.0*((x<0.5)?x:1.0-x), k);
    return (x<0.5)?a:1.0-a;
}

float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}

float map(float n, float i1, float i2, float o1, float o2){
	return o1 + (n-i1)*(o2-i1)/(i2-i1);
	
}

vec2 scaleSDF(vec2 st, vec2 s) {
    return (st-.5)*s+.5;
}

void translateShape(inout vec2 _st, vec2 pos){
	_st += pos;
}


float triSDF(vec2 st) {
    st = (st*2.-1.)*2.;
    return max(abs(st.x) * 0.866025 + st.y * 0.5, -st.y * 0.5);
}


float plot(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y);
}
