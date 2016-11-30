using UnityEngine;
using System.Collections;

public class ModShaderTest : MonoBehaviour {

	Material mat;

	float size = 0;

	// Use this for initialization
	void Start () {
		mat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () {
		size += Time.deltaTime;
		mat.SetFloat("_Radius", 8 + Mathf.Sin(size) * 5);
		mat.SetVector("_Center", 
			new Vector3(Mathf.Sin(size) * 5,
				0,
				Mathf.Cos(size) * 5));
	}
}
