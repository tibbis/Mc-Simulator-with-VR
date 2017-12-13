using System.Collections;
using System.Collections.Generic;
using ROSBridgeLib;
using ROSBridgeLib.unity_package;
using SimpleJSON;
using UnityEngine;
using System.Text;
/**
 * This is a toy example of the Unity-ROS interface talking to the TurtleSim 
 * tutorial (circa Groovy). Note that due to some changes since then this will have
 * to be slightly re-written. This defines the velocity message that we will publish
 * 
 * @author Michael Jenkin, Robert Codd-Downey and Andrew Speers
 * @version 3.0
 **/

public class publishUnityTopic: ROSBridgePublisher {

	public static string GetMessageTopic() {
		return "/unity_topic";
	}  

	public static string GetMessageType() {
		return "unity_package/UnityMsg";
		//return "beginner_tutorials/Float32_header";
		//return "std_msgs/Float32";
	}

	public static string ToYAMLString() {
		return ToYAMLString ();
	}
}
