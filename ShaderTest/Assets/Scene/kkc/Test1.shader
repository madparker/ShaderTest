Shader "Custom/Test1" {


//Inspecter Display
	Properties {
		//RGBA
		_Color ("Color", Color) = (1,1,1,1)
		//Diffuse
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		//BUmpMap
		_MyNormalMap("My Normal Map", 2D) = "bump" {}
		//XYZW
		//_MyVector("My Vector 4", Vector) = (0, 0, 0, 0)

		//Drag panel
		_Glossiness ("Smoothness", Range(0,2.5)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0

	}






	// Do something
	SubShader {

		
		Tags { 
		//"Queue" = "Geometry"
		//"GhostEffect" = "Transparent"
		"RenderType"="Opaque" 
		}
		//Level of detail
		LOD 350


		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows


		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0


		sampler2D _MainTex;//Input Texture
		sampler2D _MyNormalMap;

		//Vector
		//float4 _MyVector;
		fixed4 _Color;

		half _Glossiness;
		half _Metallic;






		struct Input {
			float2 uv_MainTex;
			float2 uv_MyNormalMap;
		};




		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;

			o.Normal = UnpackNormal(tex2D (_MyNormalMap, IN.uv_MyNormalMap));
			o.Normal = o.Normal *200;


			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}



	FallBack "Diffuse"
}
