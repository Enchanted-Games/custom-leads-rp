#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <eg_custom_leash:leash_texture.glsl>

in vec3 Position;
in vec4 Color;
in ivec2 UV2;

uniform sampler2D Sampler2;

out float vertexDistance;
flat out vec4 vertexColor;

out vec4 adjustments;
out vec2 texCoord;
flat out int isLeash;

bool rougheq(vec3 color, vec3 target) {
    return all(lessThan(abs(color-target),vec3(0.0001)));
}

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);

    vertexDistance = fog_distance(Position, FogShape);
    vertexColor = Color;
    adjustments = ColorModulator * texelFetch(Sampler2, UV2 / 16, 0);

    isLeash = (rougheq(Color.rgb, vec3(0.498039, 0.4, 0.298039)) || rougheq(Color.rgb, vec3(0.34902, 0.278431, 0.207843))) ? 1 : 0;
    if(isLeash <= 0) return;

    bool otherHalf = mod(gl_VertexID, 100.0) > 50.0;
    texCoord = vec2(0.0);
    // calculate horizontal texture coordinates
    texCoord.x = mod(gl_VertexID / 2, 25) / 25.0;
    if(otherHalf && !MIRROR_ONE_HALF) {
        // offset and inverse the x for the other half of the lead
        texCoord.x = 1 - (texCoord.x + (2.0/50.0));
    }
    // calculate vertical texture coordinates
    texCoord.y = mod(gl_VertexID + (otherHalf ? 1 : 0), 2);
}
