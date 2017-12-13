// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

/************************************************************************************

Copyright   :   Copyright 2014 Oculus VR, LLC. All Rights reserved.

Licensed under the Oculus VR Rift SDK License Version 3.2 (the "License");
you may not use the Oculus VR Rift SDK except in compliance with the License,
which is provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

You may obtain a copy of the License at

http://www.oculusvr.com/licenses/LICENSE-3.2

Unless required by applicable law or agreed to in writing, the Oculus VR SDK
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

************************************************************************************/

// planar texturing shader

Shader "Custom/PlanarTexture" {
	Properties {
		_MainTex("Texture", 2D) = "white" {}
		_Color ("Color", Color) = (1, 1, 1, 1)
		_UAxis("U Axis", Vector) = (1, 0, 0)
		_VAxis("V Axis", Vector) = (0, 1, 0)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		Pass {
		Fog { Mode Off }
		Blend SrcAlpha One
		Cull Off
		CGPROGRAM

		#pragma vertex vert
		#pragma fragment frag
			
		#include "UnityCG.cginc"

		struct appdata_t {
			float4 vertex : POSITION;
			float2 texcoord : TEXCOORD0;
		};

		struct v2f {
			float4 vertex : SV_POSITION;
			float3 objPos : TEXCOORD0;
			float3 worldPos : TEXCOORD1;
		};

		sampler2D _MainTex;
		float4 _MainTex_ST;

		float4 _Color;
		float3 _UAxis;
		float3 _VAxis;

		v2f vert (appdata_t v)
		{
			v2f o;
			o.vertex = UnityObjectToClipPos(v.vertex);
			o.objPos = v.vertex.xyz;
			o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
			return o;
		}

		float4 frag (v2f i) : SV_Target
		{
			float2 uv = float2( dot(_UAxis, i.objPos), dot(_VAxis, i.objPos) );
			uv = TRANSFORM_TEX(uv, _MainTex);
			return tex2D(_MainTex, uv) * _Color;
		}

		ENDCG
		}
	}
}
