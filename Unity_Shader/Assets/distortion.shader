Shader "Custom/distortion"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white"{}
	}

	CGINCLUDE
#include "UnityCG.cginc"

		float circle(float2 st)
	{
		return step(0.3,distance(0.5, st));
	}

	float4 frag(v2f_img i) : SV_Target
	{
		float x = 2 * i.uv.y + sin(_Time.y * 5);
	float distort = sin(_Time.y * 10) * 0.1 *
					sin(5 * x) *(-(x - 1) * (x - 1) + 1);
		
		i.uv.x += distort;
		return float4(circle(i.uv - float2(0, distort) * 0.3),
			circle(i.uv + float2(0, distort) * 0.3),
			circle(i.uv + float2(distort,  0) * 0.3),
			1);
	}
	ENDCG

	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			ENDCG
		}
	}
}
