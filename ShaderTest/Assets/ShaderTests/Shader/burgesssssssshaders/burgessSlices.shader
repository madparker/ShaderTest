  Shader "Example/Slices" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _BumpMap ("Bumpmap", 2D) = "bump" {}
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      Cull Off
      CGPROGRAM
      #pragma surface surf Lambert
      struct Input {
          float2 uv_MainTex;
          float2 uv_BumpMap;
          float3 worldPos;
      };
      sampler2D _MainTex;
      sampler2D _BumpMap;
      void surf (Input IN, inout SurfaceOutput o) {
          clip (frac((IN.worldPos.y+IN.worldPos.z*0.1) * sin(IN.worldPos.x) + sin(IN.worldPos.y ) + sin(IN.worldPos.z  * (_Time * 0.3))) - 0.15);
//          o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
		o.Albedo = float3(sin(IN.worldPos.x * 0.1), sin(IN.worldPos.y * 0.1), sin(IN.worldPos.z * 0.1));

          o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }