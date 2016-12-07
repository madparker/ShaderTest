using UnityEngine;
using System.Collections;

public class MousePositionToMaterial : MonoBehaviour {

	public Material mat;

	void Start () {
	
	}
	
	void Update () {
		RaycastHit hit;
		if (Physics.Raycast (Camera.main.ScreenPointToRay (Input.mousePosition), out hit, Mathf.Infinity))
		{
			mat.SetVector("_MousePos", new Vector4(hit.point.x,hit.point.y,hit.point.z,0));
		}
	}
}
