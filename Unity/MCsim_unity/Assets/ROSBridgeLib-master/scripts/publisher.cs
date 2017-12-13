using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using ROSBridgeLib;
using System.Text;
using ROSBridgeLib.std_msgs;
using ROSBridgeLib.unity_package; // custom message class

public class publisher : MonoBehaviour  {
	private ROSBridgeWebSocketConnection ros = null;
	modelController modelControllerScript; // mc model
	public static bool connected = false;

	void Start() {
		if (!connected){
			ros = new ROSBridgeWebSocketConnection ("ws://192.168.10.1", 9090);
			ros.AddPublisher (typeof(publishUnityTopic)); // add publisher node
			ros.Connect ();
			DontDestroyOnLoad (transform.gameObject); // don't disconnect when reloading scene
			connected=true;
		}else {
			DestroyImmediate (transform.gameObject);
		}
	}

	// Extremely important to disconnect from ROS. OTherwise packets continue to flow
	void OnApplicationQuit() {
		if(ros!=null) {
			ros.Disconnect ();
		}
	}

	// Update is called once per frame in Unity
	void Update (){
		GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
		modelControllerScript = mc.GetComponent<modelController>(); // mc script
		//create message with parameters from mc model state
		UnityMsg msg = new UnityMsg(modelControllerScript.isRunning, modelControllerScript.isOffroad, modelControllerScript.crash, modelControllerScript.incline, modelControllerScript.leaning);
		ros.Publish(publishUnityTopic.GetMessageTopic(), msg);

		ros.Render ();
	}
}