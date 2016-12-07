Shader "Custom/SJH515_StandardShader" {

	Properties{
		_Color("Color", Color) = (1,1,1,1)
	}
	SubShader{
		Tags { "RenderType" = "Opaque" }

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Lambert

		struct Input {
			float4 color: COLOR;
		};

		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutput o) {
			fixed4 c = _Color;
			o.Albedo = 1 * c.rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
