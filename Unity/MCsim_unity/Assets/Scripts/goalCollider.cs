using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class goalCollider : MonoBehaviour {
	modelController modelControllerScript; // mc model
	private bool isOnGoal=false;
	// Use this for initialization
	void Start () {
		GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
		modelControllerScript = mc.GetComponent<modelController>(); // mc script
	}
	
	// Update is called once per frame
	void Update () {
		// if mc crashes into collider, set boolean gamewin
	}

	//model is on road
	void OnCollisionEnter(Collision collision)
	{


	}

	//model is off-road
	void OnCollisionExit(Collision collision)
	{
//		if (isOnGoal) {
//			isOnGoal = false;
//			modelControllerScript.goal = !isOnGoal; // save to mc model parameter
//			//print ("Is off-goal!" + Time.time);
//		}
	}
}
