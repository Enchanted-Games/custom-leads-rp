int BITMAP[] = int[] (
    3,3,3,3,9,9,9,9,8,9,3,4,4,4,3,8,8,9,9,0,8,9,9,3,3,3,8,9,9,2,4,4,3,3,3,3,9,9,9,8,3,3,3,9,0,9,9,8,3,3,4,4,4,1,1,8,9,0,0,3,3,9,9,9,9,8,9,3,3,4,3,3,
    7,5,7,7,7,7,7,7,5,5,7,7,7,7,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,5,5,7,7,5,7,7,7,7,7,7,5,5,7,7,5,5,7,7,7,5,7,7,5,5,5,7,7,7,7,7,6,6,5,7,7,7,7,7,5,5,7,7
);

vec4 PALETTE[] = vec4[] (
    vec4(154, 124, 86, 255) / 255,
    vec4(155, 123, 89, 255) / 255,
    vec4(143, 114, 77, 255) / 255,
    vec4(138, 109, 68, 255) / 255,
    vec4(125, 99, 61, 255) / 255,
    vec4(118, 92, 56, 255) / 255,
    vec4(112, 88, 54, 255) / 255,
    vec4(106, 83, 50, 255) / 255,
    vec4(182, 150, 116, 255) / 255,
    vec4(164, 134, 98, 255) / 255
);

#define TEXTURE_WIDTH 72
#define TEXTURE_HEIGHT 2

#define REPEAT_X 1
#define REPEAT_Y 1

#define MIRROR_ONE_HALF 1

#define USE_SIMPLE_COLOURS 0
#define COLOUR_1 vec3(0.498039, 0.4, 0.298039)
#define COLOUR_2 vec3(0.34902, 1, 0.207843)