using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MousePosition : MonoBehaviour {

	Material mat;

	float size = 0;

	// Use this for initialization
	void Start () {
		mat = GetComponent<Renderer>().material;
	}

	// Update is called once per frame
	void Update () {

		Vector3 mouseWorldPos = Camera.main.ScreenToWorldPoint(Input.mousePosition);

		mouseWorldPos.z = Camera.main.nearClipPlane;

		print("mousePos: " + Input.mousePosition);

		mat.SetVector("_MousePos", mouseWorldPos);
	}
}
