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

//		Vector3 mouseWorldPos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
//
//		mouseWorldPos.z = Camera.main.nearClipPlane;

		RaycastHit hit;

		if(Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit, Mathf.Infinity)){

			Vector3 mousePos = hit.point;

//			mousePos.z = transform.position.z;

			print("mousePos: " + mousePos);

			mat.SetVector("_MousePos", mousePos);
		}

	}
}
