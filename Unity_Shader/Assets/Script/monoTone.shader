Shader "Custom/monoTone" 
{
	Properties
	{
		_MainTex("MainTex", 2D) = ""{}
	}

		HLSLINCLUDE

	#include "Packages/com.unity.postprocessing/PostProcessing/Shaders/StdLib.hlsl"

		TEXTURE2D_SAMPLER2D(_MainTex, sampler_MainTex);
		float _Blend;

	float4 Frag(VaryingsDefault i) : SV_Target
	{
		float4 c = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoord);
		float gray = c.r * 0.3 + c.g * 0.6 + c.b * 0.1;
		c.rgb = float3(gray, gray, gray);
		return c;
	}

		ENDHLSL

		SubShader
	{
		Cull Off ZWrite Off ZTest Always

			Pass
		{
			HLSLPROGRAM

				#pragma vertex VertDefault
				#pragma fragment Frag

			ENDHLSL
		}
	}
}