Shader "Custom/HoleShader" {
	Properties {
	  _MainTex ("Texture", 2D) = "white" {}
	  _BumpMap ("Bumpmap", 2D) = "bump" {}
	  _MousePos ("Mouse Pos", Vector) = (0,0,0)
	  _Radius ("Radius", float) = 2
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
	  float3 _MousePos;
	  float _Radius;

	  void surf (Input IN, inout SurfaceOutput o) {
	  	float dist = distance(IN.worldPos.xy, _MousePos.xy);

	  	clip(dist - _Radius);

//	      clip (frac((IN.worldPos.y+IN.worldPos.z*0.1) * .5) - 0.5);
	      o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
	      o.Normal = UnpackNormal (tex2D (_BumpMap, IN.uv_BumpMap));
	  }
	  ENDCG
	} 
	Fallback "Diffuse"
	}
