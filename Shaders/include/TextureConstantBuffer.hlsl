
// L'adresse 5 est r�serv� aux param�tres classique de r�glage de la texture
cbuffer textureConstantBuffer: register(b5){
	float	XOffset;
	float	YOffset;
	float	TilingWidth;
	float	TilingHeight;
	float4	MainColor;
	bool	HasTexture;
};