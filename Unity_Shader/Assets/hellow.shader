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
       return float4(i.uv.x, i.uv.y, 0, 1);
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
