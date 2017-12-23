using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class roadCollider : MonoBehaviour {
	public bool isOnRoad;
	modelController modelControllerScript; // mc model
	// Use this for initialization
	void Start () {
		GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
		modelControllerScript = mc.GetComponent<modelController>(); // mc script
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	//model is on road
	void OnCollisionEnter(Collision collision)
	{
		if (!isOnRoad) {
			isOnRoad = true;
			modelControllerScript.isOffroad = !isOnRoad; // save to mc model parameter

			//print ("Is on road!" + Time.time);
		}
	}

	//model is off-road
	void OnCollisionExit(Collision collision)
	{
		if (isOnRoad) {
			isOnRoad = false;
			modelControllerScript.isOffroad = !isOnRoad; // save to mc model parameter
			//print ("Is off-road!" + Time.time);
		}
	}

}
