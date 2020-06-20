Shader "ShaderSketches/Template"
{
   Properties
   {
       _MainTex ("MainTex", 2D) = "white"{}
   }

   CGINCLUDE
   #include "UnityCG.cginc"

   float4 frag(v2f_img i) : SV_Target
   {
		float d = distance(float2(0.5,0.5),i.uv);
		float a = abs(cos(_Time.y)) * 0.4;
		return step( a , d ) ;
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
