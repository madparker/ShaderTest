Shader "Example/Normal Extrusion Noca" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
      _Amount ("Extrusion Amount", Range(-1,1)) = 0.5
      	_Center ("Center", Vector) = (0,0,0,0)
		_Radius ("Radius", Float) = 0.5
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surf Lambert vertex:vert
      struct Input {
          float2 uv_MainTex;
          float3 worldPos;
      };
      float _Amount;
      void vert (inout appdata_full v) {
          v.vertex.z += v.normal * _Amount;
          v.vertex.x += v.normal * _Amount*sin(v.vertex.y*(_Time[3]/2));

      }
      sampler2D _MainTex;
      float3 _Center;
		float _Radius;

				void surf (Input IN, inout SurfaceOutput o) {
			float d = distance(_Center, IN.worldPos);
			float dN = 1 - saturate(d / _Radius);
			
			if (dN > 0.25 && dN < 0.3)
				o.Albedo = half3(1,1,1);
			else
				o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
		}
//      void surf (Input IN, inout SurfaceOutput o) {
//          o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
//      }
      ENDCG
    } 
    Fallback "Diffuse"
  }