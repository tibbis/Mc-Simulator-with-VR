using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VR;
using Oculus;



public class humanInput : MonoBehaviour {

	private float xDiff, body_origin_x, body_origin_z;
	private Transform VRPosition;
	public float leaningThreshold=0.2f; // threshold for leaning (in meters)
	public bool enableGUIDebugging=false;
	private modelController modelControllerScript;

	public Transform avatar_body;

	// Use this for initialization
	void Start () {
		GameObject VRHeadset = GameObject.Find ("MainCamera"); // get VR headset gameobject
		//Transform VrOrigin = VRHeadset.transform; // get starting origin
		VRPosition = VRHeadset.transform;

		GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
		modelControllerScript = mc.GetComponent<modelController>(); // mc script

		// save original positions
		body_origin_x = avatar_body.localEulerAngles.x;
		body_origin_z = avatar_body.localEulerAngles.z;

	}
	
	// Update is called once per frame
	void Update () {

		//get total difference 
		//Vector3.Distance(VRPosition.position, transform.position); // get distance from vectors

		//get distance components
		float xDiff_temp = VRPosition.position.x - transform.position.x;
		float yDiff_temp = VRPosition.position.y - transform.position.y;

		xDiff = Mathf.Round((xDiff_temp)*100f)/100f; //round

		if (Mathf.Abs(xDiff) >= leaningThreshold) {
			modelControllerScript.leaning = xDiff - leaningThreshold; // save to model

		} else {
			modelControllerScript.leaning = 0f; // no leaning
		}

		//move avatar model (rotate upperBody) 
		avatar_body.localEulerAngles = new Vector3((body_origin_x -(float)yDiff_temp*110f), -(float)xDiff_temp*100f, 0f) ; // move avatar body 


		// touch controller input
		//Quaternion leftControllerRotaion =  OVRInput.GetLocalControllerRotation (OVRInput.Controller.LTouch); // get left controller rotation
		//Debug.Log("x: " +leftControllerRotaion.eulerAngles.x.ToString() + ", y: "+ leftControllerRotaion.eulerAngles.y.ToString() + ", z: "+ leftControllerRotaion.eulerAngles.z.ToString() );


	}

	//show text on screen
	void OnGUI()
	{
		// show info on screen
		if (enableGUIDebugging) {
			
			Rect rectObj=new Rect(40,10,200,400);
			GUIStyle style = new GUIStyle();
			style.normal.textColor = Color.green;
			style.fontSize = 30;
			if (Mathf.Abs(xDiff) >= leaningThreshold) style.normal.textColor = Color.red;
			style.alignment = TextAnchor.UpperLeft;
			GUI.Box(rectObj, "Leaning: "+ xDiff ,style);
		}
	}




}
