#include <StandardPixelInput.hlsl>
#include <transform.hlsl>

cbuffer geometry : register(b6){
	float3	CameraUpVector;
	float3	CameraRightVector;
	float3	scaleValue;
}

// Dans le cas pr�sent, ce shader se content de prendre un triangle, et de le remettre dans le flux de triangle, aucune op�ration n'est effectu�e
// Le g�om�try shader r�cup�res les sommets des primitives d�j� modifi� par le vertex shader. Les sommets de sorties du g�ometry shader vont donc
// ensuite vers le fragment/pixel shader (d'ou le "PS_IN")
[maxvertexcount(6)] // maxvertexcount d�finit le nombre maximum de sommet que l'on peut ajouter � la liste/flux
void main(point PixelInput input[1], inout TriangleStream<PixelInput> OutputStream){

	//float4 center= input[0].position;
	float4 center = float4(0.0f, 0.0f, 0.0f, 1.0f);

		float4 bottomleft = center +(- float4(CameraRightVector, 0.0f) - float4(CameraUpVector, 0.0f));
		float4 bottomright = center+( + float4(CameraRightVector, 0.0f) - float4(CameraUpVector, 0.0f));
		float4 topleft = center +(- float4(CameraRightVector, 0.0f) + float4(CameraUpVector, 0.0f));
		float4 topright = center +(+ float4(CameraRightVector, 0.0f) + float4(CameraUpVector, 0.0f));

	
	bottomleft	= mul(mul(projection, view), bottomleft);
	bottomright = mul(mul(projection, view), bottomright);
	topleft		= mul(mul(projection, view), topleft);
	topright	= mul(mul(projection, view), topright);

	PixelInput pbottomleft	= (PixelInput)0;
	PixelInput pbottomright = (PixelInput)0;;
	PixelInput ptopleft		= (PixelInput)0;;
	PixelInput ptopright	= (PixelInput)0;;

	pbottomleft.position	= bottomleft;
	pbottomleft.uv			= float2(0.0f,0.0f);


	pbottomright.position	= bottomright;
	pbottomleft.uv			=  float2(0.0f, 1.0f);;

	ptopleft.position		= topleft;
	ptopleft.uv				= float2(1.0f, 0.0f);

	ptopright.position		= topright;
	ptopright.uv			= float2(1.0f, 1.0f);

	// On va calculer ici les nouvelles positions des sommets
	OutputStream.Append(pbottomleft);
	OutputStream.Append(ptopleft);
	OutputStream.Append(pbottomright);

	OutputStream.Append(ptopleft);
	OutputStream.Append(pbottomright);
	OutputStream.Append(ptopright);

}
