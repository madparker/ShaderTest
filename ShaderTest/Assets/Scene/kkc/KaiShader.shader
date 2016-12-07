Shader "Custom/KaiShader" {

	Properties
	{
	//maintext is internal variable name
	//"texture" is the label displayed in unity inspector
	//[2d]is the type of variable
	//white is the default value for this variable
		_MainTex ("Texture", 2D) = "red" {}
		_WaveFreq("Wave Frequency Scalar",Float) = 10
		_WaveHeight("Wave Height",Float) = 5
		_WaveSpeed("Wave Moving Speed", Float) = 0.05
	}
	SubShader//do something
	{
		Tags { "RenderType"="Opaque" }
		LOD 100//lod = level of detail
		//kind of like draw call
		//most simple shaders are just 1 pass
		Pass
		{
			CGPROGRAM//CGPROGRAM is where shader code actually start
			//pragma is Greek for action
			//pragma tells your code to do this "pre-compiler directive"
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog

			//cginc files are just shader code
			//we are importing all this unity/function to use
			#include "UnityCG.cginc"

			//struct is like a lightweight class
			//struct are usually more containeers for data
			struct appdata
			{
				//float 4 is bassically like a vector4
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;

			};
			//v2f = vertex to fragment
			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;// s = scale, t = transform
			float _WaveFreq;
			float _WaveHeight;
			float _WaveSpeed;


			
			v2f vert (appdata v)
			{//mul = "multifly, mvp = model view projection"
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.vertex += float4(0, sin (_Time.y *_WaveFreq+ o.vertex.x),0,0) * _WaveHeight ;//float4 goes xyzw
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			//frag program runs constantly for every pixel
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				//texture speed
				fixed4 col = tex2D(_MainTex, i.uv + float2(_Time.y * _WaveSpeed,0));
				// apply fog
				UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
			}
			ENDCG//where cg ends
		}
	}


}
