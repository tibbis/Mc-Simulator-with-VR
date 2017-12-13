using System.Collections;
using System.Collections.Generic;
using ROSBridgeLib;
using ROSBridgeLib.std_msgs;
using System.Collections;
using SimpleJSON;
using UnityEngine;
using System.Text;
using ROSBridgeLib.unity_package;
/**
 * This is a toy example of the Unity-ROS interface talking to the TurtleSim 
 * tutorial (circa Groovy). Note that due to some changes since then this will have
 * to be slightly re-written. This defines the velocity message that we will publish
 * 
 * @author Michael Jenkin, Robert Codd-Downey and Andrew Speers
 * @version 3.0
 **/

	
public class Arraysubscibe: ROSBridgeSubscriber {


		public new static string GetMessageTopic() {
			return "/unityarraytopic";
		}  

		public new static string GetMessageType() {
			return "unity_package/Simulink2Unity";
		}

		public new static ROSBridgeMsg ParseMessage(JSONNode msg) {
		return new Simulink2Unity(msg);
		}

		public new static void CallBack(ROSBridgeMsg msg) {
		;


			modelController modelControllerScript;
			GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
			modelControllerScript = mc.GetComponent<modelController>(); // mc script
			
		modelControllerScript.timeSinceCB =  0f ; // reset counter for timeout limit

			Simulink2Unity arraymsg = (Simulink2Unity) msg;
		//Debug.Log (arraymsg.ToYAMLString ());
		//Debug.Log(arraymsg.ToString ());
			
			//parse message and send to model script
		modelControllerScript.roll = arraymsg._roll;
		modelControllerScript.pitch = arraymsg._pitch;
		modelControllerScript.yaw =  arraymsg._yaw;
		modelControllerScript.steeringAngle =  arraymsg._steering_angle;
		modelControllerScript.rpm =  arraymsg._rpm;
		modelControllerScript.speed =  arraymsg._speed;
		modelControllerScript.brake_front = arraymsg._brake_front;
		modelControllerScript.throttle = arraymsg._throttle;
		modelControllerScript.clutch_switch = arraymsg._clutch_switch;
		modelControllerScript.gear = arraymsg._gear;
		modelControllerScript.emergencyStop = arraymsg._emergencyStop;
		modelControllerScript.rigPositionX = arraymsg._rigPositionX;
		//Debug.Log (arraymsg);
		}


	}
