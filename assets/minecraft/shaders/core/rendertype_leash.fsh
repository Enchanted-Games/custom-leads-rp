#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <eg_custom_leash:leash_texture.glsl>

in float vertexDistance;
flat in vec4 vertexColor;

in vec4 adjustments;
in vec2 texCoord;
flat in int isLeash;

out vec4 fragColor;

ivec2 pixelateUV(vec2 uv, vec2 resolution) {
    return ivec2(abs(floor(uv * resolution)));
}

void main() {
    if(isLeash <= 0) {
        fragColor = linear_fog(vertexColor * adjustments, vertexDistance, FogStart, FogEnd, FogColor);
        return;
    }

    vec2 uv = fract(texCoord * vec2(REPEAT_X, REPEAT_Y));
    ivec2 integerUV = pixelateUV(uv, vec2(TEXTURE_WIDTH, TEXTURE_HEIGHT));
    int bitmapIndex =  integerUV.x + (TEXTURE_WIDTH * integerUV.y);

    vec4 color = PALETTE[BITMAP[bitmapIndex]] * adjustments;

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
