#include <transform.hlsl>
#include <StandardVertexInput.hlsl>
#include <SkyboxPixelInput.hlsl>

PixelInput main(VertexInput input)
{
	PixelInput output;

	// L'id�e derri�re .xyww, c'est que si z = w, alors z/w = 1 et donc le point se trouve sur le plan
	// �loign� du frustum
	output.position = mul(mul(projection, mul(view, model)), float4(input.position, 1.0f)).xyww;

	
	output.stuff = float4( input.position,1.0f);
	return output;

}
