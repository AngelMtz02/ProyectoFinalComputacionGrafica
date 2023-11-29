#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

const float amplitude = 1.3;  // Ajusta la amplitud del movimiento
const float frequency = 0.5;  // Ajusta la frecuencia del movimiento
const float PI = 3.14159;
out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float time;

void main()
{
   
    float distance = length(aPos);
    float horizontalDisplacement = amplitude * sin(PI * frequency * time);
    // Aplica el desplazamiento horizontal a la posición del vértice
    vec3 displacedPosition = aPos + vec3(horizontalDisplacement, 0.0, 0.0);
    gl_Position = projection * view * model * vec4(displacedPosition, 1.0);
    TexCoords = aTexCoords;
}
