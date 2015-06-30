Shader "LGBT Pride" {
Properties {
	_MainTex ("Base (RGB)", 2D) = "white" {}
	_Intensity ("Intensity", Range (0.0, 1.0)) = 0.7
	[MaterialToggle] _Gradation ("Gradation", Float) = 0.0
}

SubShader {
	Pass {

CGPROGRAM
#pragma vertex vert_img
#pragma fragment frag
#include "UnityCG.cginc"

uniform sampler2D _MainTex;
half _Intensity;
bool _Gradation;

fixed4 frag (v2f_img i) : SV_Target
{
	fixed4 original = tex2D(_MainTex, i.uv);

	fixed4 pride;
	
	if (_Gradation) {
		if (i.uv.y < 1.0 / 5.0) pride = lerp(fixed4(126.0 / 255.0, 16.0 / 255.0, 123.0 / 255.0, 1), fixed4(17.0 / 255.0, 36.0 / 255.0, 251.0 / 255.0, 1), i.uv.y / (1.0 / 5.0));
		else if (i.uv.y < 2.0 / 5.0) pride = lerp(fixed4(17.0 / 255.0, 36.0 / 255.0, 251.0 / 255.0, 1), fixed4(19.0 / 255.0, 129.0 / 255.0, 21.0 / 255.0, 1), (i.uv.y - (1.0 / 5.0)) / (1.0 / 5.0));
		else if (i.uv.y < 3.0 / 5.0) pride = lerp(fixed4(19.0 / 255.0, 129.0 / 255.0, 21.0 / 255.0, 1), fixed4(254.0 / 255.0, 254.0 / 255.0, 57.0 / 255.0, 1), (i.uv.y - (2.0 / 5.0)) / (1.0 / 5.0));
		else if (i.uv.y < 4.0 / 5.0) pride = lerp(fixed4(254.0 / 255.0, 254.0 / 255.0, 57.0 / 255.0, 1), fixed4(253.0 / 255.0, 128.0 / 255.0, 35.0 / 255.0, 1), (i.uv.y - (3.0 / 5.0)) / (1.0 / 5.0));
		else if (i.uv.y < 5.0 / 5.0) pride = lerp(fixed4(253.0 / 255.0, 128.0 / 255.0, 35.0 / 255.0, 1), fixed4(252.0 / 255.0, 15.0 / 255.0, 29.0 / 255.0, 1), (i.uv.y - (4.0 / 5.0)) / (1.0 / 5.0));
	} else {
		if (i.uv.y < 1.0 / 6.0) pride =  fixed4(126.0 / 255.0, 16.0 / 255.0, 123.0 / 255.0, 1);
		else if (i.uv.y < 2.0 / 6.0) pride =  fixed4(17.0 / 255.0, 36.0 / 255.0, 251.0 / 255.0, 1);
		else if (i.uv.y < 3.0 / 6.0) pride =  fixed4(19.0 / 255.0, 129.0 / 255.0, 21.0 / 255.0, 1);
		else if (i.uv.y < 4.0 / 6.0) pride =  fixed4(254.0 / 255.0, 254.0 / 255.0, 57.0 / 255.0, 1);
		else if (i.uv.y < 5.0 / 6.0) pride =  fixed4(253.0 / 255.0, 128.0 / 255.0, 35.0 / 255.0, 1);
		else pride = fixed4(252.0 / 255.0, 15.0 / 255.0, 29.0 / 255.0, 1);
	}
	
	return lerp(original, pride, _Intensity);
}
ENDCG

	}
}

}
