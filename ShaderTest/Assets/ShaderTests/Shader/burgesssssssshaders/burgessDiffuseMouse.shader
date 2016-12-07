  Shader "Example/Diffuse Simple" {
    Properties {
      _MousePos ("MousePos", Vector) = (1,1,1,1)
    }

    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surf Lambert
      struct Input {
          float4 color : COLOR;
      };

      float3 _MousePos;

      void surf (Input IN, inout SurfaceOutput o) {
      	float x = _MousePos.x;
      	float y = _MousePos.y;
      	float z = _MousePos.z;
        o.Albedo = float3(x, y, z);
      }
      ENDCG
    }
    Fallback "Diffuse"
  }