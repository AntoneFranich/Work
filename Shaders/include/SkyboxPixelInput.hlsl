
// J'ai un peu bataill� avec ce truc, apparemment si je met COLOR apr�s SV_POSITION,
// ca ne fonctionne pas
struct PixelInput
{
	float4 stuff		: COLOR;
	float4 position		: SV_POSITION;	// Position "transform� donc pas trop trop utilisable

};