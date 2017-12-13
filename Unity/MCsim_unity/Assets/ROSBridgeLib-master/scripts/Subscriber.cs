using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using ROSBridgeLib.std_msgs;
using ROSBridgeLib;
using System.Text;

public class Subscriber : MonoBehaviour {
	private ROSBridgeWebSocketConnection ros = null;
	public static bool connected = false;

	// Use this for initialization
	void Start () {
		if (!connected) {
			ros = new ROSBridgeWebSocketConnection ("ws://192.168.10.1", 9090);
			ros.AddSubscriber (typeof(Arraysubscibe)); // subscribe to simulink array messages
			DontDestroyOnLoad (transform.gameObject); // don't disconnect when reloading scene
			ros.Connect (); // connect ROS
			connected = true;
		} else {
			DestroyImmediate (transform.gameObject);
		}
	}

	// Extremely important to disconnect from ROS. OTherwise packets continue to flow
	void OnApplicationQuit() {
		if(ros!=null) {
			ros.Disconnect ();
		}
	}
		

	// Update is called once per frame
	void Update () {
		ros.Render ();
	}

}
