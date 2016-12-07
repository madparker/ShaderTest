Shader "Custom/SJH515_SliceShader3" {
	Properties{
		_Color("Color", Color) = (1,1,1,1)
	}
	SubShader{
		Tags{ "RenderType" = "Opaque" }
		Cull Off //Turn off backface culling?
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
#pragma surface surf Lambert

	struct Input {
		float3 worldPos; //Get the world position of the object this shader's material is attached to
		//float4 color: COLOR; //Get the color of the object this shader's material is attached to
	};

	fixed4 _Color;

	void surf(Input IN, inout SurfaceOutput o) {

		/*Clip actually gets rid of the strips. The smaller the multiplier on the frac() is, the bigger the strips.
		Similarly, the smaller the subtraction is, the closer together the strips are.
		*/
		clip(frac((IN.worldPos.x + IN.worldPos.y + IN.worldPos.z*0.1) * 5) - 0.5);
		fixed4 c = _Color;
		o.Albedo = 1 * c.rgb; //Set the albedo to white
	}
	ENDCG
	}
		FallBack "Diffuse"
}
/*	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}*/
