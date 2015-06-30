using System;
using UnityEngine;

namespace LGBTPride
{
	[RequireComponent(typeof (Camera))]
	[ExecuteInEditMode]
    [AddComponentMenu("LGBT Pride")]

	public class LGBTPrideEffect : MonoBehaviour {
		[Range (0.0f, 1.0f)]
		public float intensity = 0.7f;
		public bool gradation = false;
		
		private Material material;

		void Start()
		{
			material = new Material (Shader.Find ("LGBT Pride"));
		}

		void OnDisable()
		{
			if (material)
			{
				DestroyImmediate(material);
			}
		}

		void OnRenderImage (RenderTexture source, RenderTexture destination) {
			material.SetFloat("_Intensity", intensity);
			material.SetFloat("_Gradation", gradation ? 1.0f : 0.0f);
			Graphics.Blit (source, destination, material);
        }
    }
}
