using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class modelController : MonoBehaviour {
	
	//audio sources and clips
	[SerializeField] private AudioSource CrashAudioSource;                  
	[SerializeField] private AudioClip crashSound;
	[SerializeField] private AudioSource OffroadAudioSource;
	[SerializeField] private AudioClip offRoadSound;
	[SerializeField] private AudioClip hitSound;

	// dynamic moveable objects
	public GameObject mc_model;
	public GameObject torque_indicator;
	public GameObject speed_indicator;
	public GameObject handlebar; 
	public GameObject spotlight;
	public GameObject gameOverUI; // game over menu
	public GameObject gameWinUI;
	public GameObject reticle;
	private GameObject right_hand;
	public Transform brake_model;
	public Transform clutch_model;
	public static bool started=false;
	public bool gameScore = false;
	[HideInInspector] public bool newScore = false;

	// model state variables updated from ROS (Subscribed)
	[HideInInspector] public float roll = 0f; //degrees
	[HideInInspector] public float pitch = 0f; //degrees
	[HideInInspector] public float yaw = 0f; // degrees
	[HideInInspector] public float speed = 0f; //km/h
	[HideInInspector] public float rpm = 0f; // rpm
	[HideInInspector] public float steeringAngle = 0f; //(-35 - 35)
	[HideInInspector] public float brake_front = 0f; // (0-1)
	[HideInInspector] public float throttle = 0f; // (0-1)
	[HideInInspector] public float clutch_switch = 0f; // (0-1)
	[HideInInspector] public int gear = 0; // (0-6)
	[HideInInspector] public int emergencyStop = 0; // (int)
	[HideInInspector] public float rigPositionX = 0; // (float)



	//model state variables to send to simulink (Published)
	[HideInInspector] public float incline=0f; //(degrees)
	[HideInInspector] public float leaning = 0f; // (meters horisontal plane)
	[HideInInspector] public int crash = 0; //(0-3)
	[HideInInspector] public bool isOffroad = false;
	[HideInInspector] public bool isRunning = false;
	[HideInInspector] public bool manualGear = false; 

	[HideInInspector] public float gameTime = 0f; // simulation time
	[HideInInspector] public bool goal = false; // game win

	private bool rigHasBeenOn = false;
	private float inclineThreshold = 0.5f; // threshold for rumble incline effect on rig

	//private constants
	private float SPEED_START_ANGLE, MAX_SPEED, MAX_SPEED_ANGLE, MAX_TORQUE, TORQUE_START_ANGLE, MAX_TORQUE_ANGLE, HANDLEBAR_START_ANGLE;
	private float right_hand_x, right_hand_y, right_hand_z, brakes_x, brakes_y, brakes_z, clutch_x, clutch_y, clutch_z; // hands and brakes/clutch origins

	//default angles of indicators (origins)
	private float spdY, spdZ, rpmY, rpmZ;
	private float oldAngleX=0f;
	private float timeSinceCrash = 0f;
	private float truePitch=0f;
	private float startingControllerPos=0f;
	private GameObject mainCamera;
	public bool enableGameOver=true;
	[HideInInspector] public float timeSinceCB=0f;
	private float ConnectionTimeout=0.3f;

	// Use this for initialization
	void Start () {
		mainCamera = GameObject.Find ("VR_mc"); // get main camera
		right_hand = GameObject.Find("throttleHand");

		isRunning = true; // simulation started
		OffroadAudioSource.clip=offRoadSound;
		initTransforms(); //save original positions and rotations of animated objects
		startingControllerPos= OVRInput.GetLocalControllerPosition(OVRInput.Controller.RTouch).x;
	}

	
	// Update is called once per frame
	void Update () {

		checkSimulinkConnection ();
		filterRigNoise(); 
		moveMotorcycle (); // move and rotate model
		rotateHandlebar(steeringAngle); // update handlebar
		animateThrottle (); // animate hand for throttle
		updateIndicators (speed, rpm); // update dashboard UI
		animateBrakeAndClutch (); // animate braking and clutch bars

		motorbikeIncline(); // get incline


		if (isRunning) { // count simulation time
			gameTime += Time.deltaTime;
		}

		if ( crash!=0 && ((gameTime - timeSinceCrash) >= 1f)) { // reset soft-crash value after x seconds
			crash = 0;
			timeSinceCrash = 0;
		}

		if (emergencyStop == 1 && rigHasBeenOn) { // external stop switch
			main.restartGame ();
		} else if (emergencyStop == 7 && !rigHasBeenOn) {
			rigHasBeenOn=true;
		}

		if (transform.gameObject.transform.position.y < -20f) // if fall down
			gameOver ("earth");
		if (isOffroad && !OffroadAudioSource.isPlaying && isRunning) { // play offroad sound
			OffroadAudioSource.Play ();
			OffroadAudioSource.loop = true;
		} else if (!isOffroad && OffroadAudioSource.isPlaying) {
			OffroadAudioSource.Stop ();
		} else if (!isRunning){
			OffroadAudioSource.Stop ();
		}

	}



	//######## FUNCTIONS #########################################



	void filterRigNoise(){ // filter out accelermoter noise from rig motion
		
		Vector3 pos= OVRInput.GetLocalControllerPosition(OVRInput.Controller.RTouch);
		//Debug.Log ("touchcontroller x:");
		//Debug.Log ( Math.Round(pos.x*100)/100);
		mainCamera.transform.localEulerAngles = new Vector3(mainCamera.transform.localRotation.x,mainCamera.transform.localRotation.y,mainCamera.transform.localRotation.z - roll);
		mainCamera.transform.localPosition = new Vector3(mainCamera.transform.localPosition.x, mainCamera.transform.localPosition.y, -(float)(Math.Sin(pitch*Math.PI/180f))); // move camera in z position
		//mainCamera.transform.localPosition = new Vector3(mainCamera.transform.localPosition.x, mainCamera.transform.localPosition.y,mainCamera.transform.localPosition.z -(float)(Math.Sin(pitch*Math.PI/180f))); // move camera in z position

	}

	void moveMotorcycle(){
		// move forward

		Vector3 FORWARD = transform.TransformDirection(Vector3.forward);
		transform.localPosition += FORWARD * speed *Time.deltaTime / 3.6f;
		//Rotate model in x y z
		truePitch = 0; // boost pitch depending on simulink value
		transform.rotation = Quaternion.Euler(truePitch, yaw, roll); // dont pitch model (otherwise no incline from game)
	}

		
	//rotate handlebar
	void rotateHandlebar(float angle){
		handlebar.transform.localEulerAngles = new Vector3(0,-22.3f,-(angle+HANDLEBAR_START_ANGLE)); // rotate speed indicator
	}

	//get bike x-angle för rig feedback
	void motorbikeIncline(){ 
		float angle = mc_model.transform.eulerAngles.x;
		float diff = angle - oldAngleX;
		if (Mathf.Abs (diff) >= inclineThreshold) {
			//print("incline: "+ diff);
			oldAngleX = angle;
			incline = (diff > 180) ? diff -360 : diff; // convert to negative values
		} else {
			incline = (oldAngleX > 180) ? oldAngleX -360 : oldAngleX; // convert to negative values
		}

	}

	//animate hand
	void animateThrottle(){
		float angle = 22f*throttle; // max wrist angle 12 degrees
	//	Debug.Log(right_hand_z - angle);
		right_hand.transform.localEulerAngles = new Vector3(right_hand_x, right_hand_y ,right_hand_z-angle) ; // rotate hands 

	}

	//animate brake and clutch
	void animateBrakeAndClutch(){
		float angleBrake = 20f*brake_front; // max brake-bar angle 15 degrees
		float angleClutch = -20f*clutch_switch;
		brake_model.localEulerAngles = new Vector3(brakes_x, brakes_y ,brakes_z + angleBrake) ; // rotate brake 
		clutch_model.localEulerAngles = new Vector3(clutch_x, clutch_y ,clutch_z + angleClutch) ; // rotate clutch 

	}

	void initTransforms(){
		initDashboard (); // init dashboard UI
		//init wrists on throttle
		right_hand_x = right_hand.transform.localEulerAngles.x; 
		right_hand_y = right_hand.transform.localEulerAngles.y;
		right_hand_z = right_hand.transform.localEulerAngles.z;

		//init braking and clutch bars origins
		brakes_x = brake_model.localEulerAngles.x; 
		brakes_y = brake_model.localEulerAngles.y;
		brakes_z = brake_model.localEulerAngles.z;
	}

	//handle colliders
	void OnTriggerEnter(Collider other){

		if (gameScore){
			if (other.name == "goal" && !goal)  { // goal
				goal=true;
				gameWin();

			}
			else if (other.name == "cheatGoal" && !goal) { // going wrong way in to goal
				gameOver ("CHEATER!");

			}

		}
		
		if (other.name != "road" && other.name !="road2" && other.name !="goal" && other.name!="cheatGoal") { // do not crash into road
			if (this.enabled) { // if not already crashed
				print ("Crashed in to object: " + other.gameObject.name);
				//if speed exceed crash limit, end game. otherwise stop bike. 

				if (speed >= 50f) { //hard crash																							
					crash = 2; // send to simulink hard crash
					CrashAudioSource.clip = crashSound;
					CrashAudioSource.volume = 0.7f;
					if (!CrashAudioSource.isPlaying)
						CrashAudioSource.Play ();
					OffroadAudioSource.Stop ();
					gameOver (other.gameObject.name); //bring gameOver UI and stop model
				} else { //soft crash
					crash = 1;
					timeSinceCrash = gameTime;
					CrashAudioSource.clip = hitSound;
					CrashAudioSource.volume = 1f;
					if (!CrashAudioSource.isPlaying)
						CrashAudioSource.Play ();
					
				}
			}
		}
	}

	public void gameWin(){ // leaderscore if game score enabled and goal completed
		Debug.Log("Goal!");
		isRunning = false; // stop simulator
		gameWinUI.SetActive (true); // show game over UI
		reticle.SetActive(true); // show reticle ui

		float bestTime = PlayerPrefs.GetFloat("Score");

		if ((bestTime - gameTime) > 0f ){ // new high score
			PlayerPrefs.SetFloat ("Score", gameTime); // save best time locally on PC
			GameObject title = GameObject.Find ("winTitle"); // get text body
			title.GetComponent<UnityEngine.UI.Text> ().text = "New highscore!"; // write to UI
			PlayerPrefs.SetFloat("Score", gameTime);// save score
			bestTime=gameTime;
			newScore = true;
		}


		//calculate gameTime in min, seconds etc...
		TimeSpan t = TimeSpan.FromSeconds ((double)gameTime);
		string time = getTime (t);
		GameObject text = GameObject.Find ("GameWinText"); // get text body
		string body = "You completed the map within " + time + ".\n"+ "Best time: "+ bestTime;
		text.GetComponent<UnityEngine.UI.Text> ().text = body; // write to UI
		GameObject obs1=GameObject.Find("goal");
		GameObject obs2=GameObject.Find("cheatGoal");
		obs1.SetActive (false); // remove colliders
		obs2.SetActive (false);

		gameTime = 0f; // reset time counter
		this.enabled = false; // stop model

	}

	string getTime(TimeSpan t){ // convert to string 
		float seconds = t.Seconds;
		float minutes = t.Minutes;
		float millis = t.Milliseconds;
		string time;
		if (minutes == 0) {
			time = seconds.ToString() + " seconds and "+millis+" ms";
		}
		else {
			time =  minutes.ToString() + " min, " + seconds.ToString() + " s, and " + millis+" ms";
		}
		return time;
	}

	void checkSimulinkConnection(){
		if (timeSinceCB >= ConnectionTimeout) {
			gameOver ("Simulink");
		} else {
			timeSinceCB += Time.deltaTime;
		}
	}


	//toggle mc spotlight light
	public void setSpotlight(bool value){
		spotlight.SetActive(!value);
	}
		
	//end game
	void gameOver(string obj){
		if (enableGameOver || obj=="Simulink"){
		print ("Game Over");
		isRunning = false; // stop simulator
		gameOverUI.SetActive (true); // show game over UI
		reticle.SetActive(true); // show reticle ui

		//calculate gameTime in min, seconds etc...
		TimeSpan t = TimeSpan.FromSeconds ((double)gameTime);
		float seconds = t.Seconds;
		float minutes = t.Minutes;
		string time;
		if (minutes == 0) {
			time = seconds.ToString() + " seconds";
		}
		else {
			time =  minutes.ToString() + " min and " + seconds.ToString() + "s ";
		}
		GameObject text = GameObject.Find ("GameOverText"); // get text body
		string body = "You crashed into "+ obj + " at "+ speed.ToString("0.###") + " km/h, after " + time;
		text.GetComponent<UnityEngine.UI.Text> ().text = body; // write to UI

		gameTime = 0f; // reset time counter

		this.enabled = false; // stop model
		}
	}


	void initDashboard(){
		//define constants for dashboard UI
		MAX_SPEED_ANGLE = 298.53f;
		MAX_SPEED = 270.0f;
		MAX_TORQUE = 16.0f;
		MAX_TORQUE_ANGLE = 299.3f;
		TORQUE_START_ANGLE = -(torque_indicator.transform.localEulerAngles.x -360.0f); // get default zero position
		SPEED_START_ANGLE = -(speed_indicator.transform.localEulerAngles.x -360.0f); // get default zero position
		HANDLEBAR_START_ANGLE = -(handlebar.transform.localEulerAngles.z -360.0f); // get default zero position

		// get and save all aother rotations 
		spdY = speed_indicator.transform.localEulerAngles.y;
		spdZ = speed_indicator.transform.localEulerAngles.z;
		rpmY = torque_indicator.transform.localEulerAngles.y;
		rpmZ = torque_indicator.transform.localEulerAngles.z;
	}

	//(speed [km/h], torque: [1/min x1000])
	void updateIndicators(float speed, float torque){ 
		torque = torque / 1000f; // x1000 on screen
		// limit indicator
		if (speed<0) 
			speed=-speed; // moving backwards
		else if (speed > MAX_SPEED) 
			speed = MAX_SPEED; // too fast
		float speedAngle = speed * ((MAX_SPEED_ANGLE-SPEED_START_ANGLE)/MAX_SPEED) + SPEED_START_ANGLE; // calculate corresponding x-angle

		if (torque < 0)
			torque = -torque;
		else if (torque > 16)
			torque = MAX_TORQUE;
		float rpmAngle = torque * ((MAX_TORQUE_ANGLE-TORQUE_START_ANGLE)/MAX_TORQUE) + TORQUE_START_ANGLE; // calculate corresponding x-angle
		torque_indicator.transform.localEulerAngles = new Vector3(-rpmAngle,rpmY,rpmZ); // rotate speed indicator
		speed_indicator.transform.localEulerAngles = new Vector3(-speedAngle,spdY,spdZ); // rotate speed indicator

	}



	//exit application
	public void quitGame (){
		print ("Emergency stop...");
		if (Application.isEditor)
			UnityEditor.EditorApplication.isPlaying = false;
		else Application.Quit ();

	}

}
