Shader "Custom/NewSurfaceShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0

		_Center ("Center", Vector) = (1,0,0,0)
		_Radius ("Radius", Float) = 0.5
	}
	SubShader {
		//Tags { "RenderType"="Transparency" }
		Tags { "RenderType"="Opaque"}
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard Lambert alpha

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
			float3 worldPos;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		float3 _Center;
		float _Radius;

		void surf (Input IN, inout SurfaceOutputStandard o) {

			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

			float d = distance(_Center, IN.worldPos);
			float dN = 1 - saturate(d / _Radius);
			dN = step(0.25, dN) * step(dN, 0.3);
			o.Albedo = c.rgb * (1-dN) + half3(1,1,1) * dN;
//
//			// Albedo comes from a texture tinted by color
////			o.Albedo = c.rgb;
//			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = 1-dN;
		}
		ENDCG
	}
//	FallBack "Diffuse"
}
