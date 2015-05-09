// List des entr�es possible du Geometry Shader
//point		VS_OUTPUT input[1]	// Because a point contains a single element, we do not have to specify [1] if we don't want
//line		VS_OUTPUT input[2]
//lineadj		VS_OUTPUT input[4]
//triangle	VS_OUTPUT input[3]
//triangleadj VS_OUTPUT input[6]


// Un geometry shader permet de supprimer, modifier ou rajouter des primitives. Il se situe entre le vertex Shader et le Pixel Shader
// Un Geometry shader ne retourne aucune donn�e, au contraire, on pr�cise dans le deuxi�me argument de la fonction main
// un "flux" dans lequel on rajoute des primitives. Ce flux peut �tre de type
//		*PointStream
//		*LineStream
//		*TriangleStream

#include <StandardPixelInput.hlsl>

// Dans le cas pr�sent, ce shader se content de prendre un triangle, et de le remettre dans le flux de triangle, aucune op�ration n'est effectu�e
// Le g�om�try shader r�cup�res les sommets des primitives d�j� modifi� par le vertex shader. Les sommets de sorties du g�ometry shader vont donc
// ensuite vers le fragment/pixel shader (d'ou le "PS_IN")
[maxvertexcount(3)] // maxvertexcount d�finit le nombre maximum de sommet que l'on peut ajouter � la liste/flux
void main(triangle PixelInput input[3], inout TriangleStream<PixelInput> OutputStream){

	OutputStream.Append(input[0]);
	OutputStream.Append(input[1]);
	OutputStream.Append(input[2]);
}

