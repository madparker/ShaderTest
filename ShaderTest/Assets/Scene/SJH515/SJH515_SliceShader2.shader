Shader "Custom/SJH515_SliceShader2" {
	SubShader{
		Tags{ "RenderType" = "Opaque" }
		Cull Off //Turn off backface culling?
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
#pragma surface surf Lambert

	struct Input {
		float3 worldPos; //Get the world position of the object this shader's material is attached to
		float4 color: COLOR; //Get the color of the object this shader's material is attached to
	};

	void surf(Input IN, inout SurfaceOutput o) {
		clip(frac((IN.worldPos.x + IN.worldPos.z*0.1) * 5) - 0.5); //Clips out vertical strips at a specific interval.
		o.Albedo = 1; //Set the albedo to white
	}
	ENDCG
	}
		FallBack "Diffuse"
}
