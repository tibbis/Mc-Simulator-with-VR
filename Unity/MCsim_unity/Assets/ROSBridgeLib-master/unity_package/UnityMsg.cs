using System.Collections;
using System.Text;
using SimpleJSON;
using UnityEngine;

/**
from unity to simulink message type
// incline, leaning, running/stop, off-road, crash
 * 
 */

namespace ROSBridgeLib {
	namespace unity_package {
		public class UnityMsg : ROSBridgeMsg {
			// message data
			public float _incline, _leaning;
			public bool _running = false;
			public bool _offroad = false;
			public int _crash;

			public UnityMsg(JSONNode msg) {
				_running = bool.Parse(msg["running"]);
				_offroad = bool.Parse(msg["offroad"]);
				_crash = int.Parse(msg["crash"]);
				_incline = float.Parse(msg["incline"]);
				_leaning = float.Parse (msg ["leaning"]);
			}

			public UnityMsg(bool running, bool offroad, int crash, float incline, float leaning) {
				_running = running;
				_offroad = offroad;
				_crash = crash;
				_incline= incline;
				_leaning= leaning;
			}
			
 			public static string getMessageType() {
				return "unity_package/UnityMsg";
			}

			public override string ToString() {
				return "unity_package/UnityMsg [running=" + _running.ToString().ToLower() + ",  offroad=" + _offroad.ToString().ToLower() + ", crash=" + _crash.ToString() + ", incline=" + _incline.ToString() + ", leaning=" + _leaning.ToString() +"]";
			}

			// message encoding for ROS, needs to be correct !
			public override string ToYAMLString() { 
				return "{\"running\": " + _running.ToString().ToLower() + ", \"offroad\": " + _offroad.ToString().ToLower() + ", \"crash\": " + _crash + ", \"incline\": " + _incline +", \"leaning\": " + _leaning + "}";
			}
	}
}
}