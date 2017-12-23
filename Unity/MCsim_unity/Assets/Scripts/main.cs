using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VR;
using UnityEngine.SceneManagement;

public class main : MonoBehaviour {

	UnityEngine.UI.Text nightModeText, gearingText, calibrateText, mapText;
	modelController modelControllerScript;
	public float daylightIntensity = 1.4f;
	public float nightIntensity = 0.1f;
	private bool isCalibrating=false;
	private static string currentMap="speedway";
	private string strMessage="";

	private bool daylight= true;
	private int calibrateTimer = 0;
	private GameObject raceMap, speedwayMap;

	[SerializeField] private AudioSource effectsAudio;                       // Reference to the audio source that will play effects when the user looks at it and when it fills.
	[SerializeField] private AudioSource musicAudio;                       // Reference to the audio source that will play effects when the user looks at it and when it fills.

	[SerializeField] private AudioClip onMenuSelect;                  // The clip to play when the bar finishes filling.
	[SerializeField] private AudioClip menuMusic;                  // The clip to play when the bar finishes filling.
             

	// Use this for initialization
	void Start () {
		musicAudio.clip = menuMusic;
		musicAudio.loop = true;
		musicAudio.Play ();
		GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
		modelControllerScript = mc.GetComponent<modelController>(); // mc script
		modelControllerScript.setSpotlight(daylight); 

		raceMap = GameObject.Find("raceTrackLakeLevel");
		speedwayMap = GameObject.Find("DG MotorSpeedWay");

		initMap ();
		if (PlayerPrefs.GetFloat("Score")==0) // first play
			PlayerPrefs.SetFloat ("Score", (float)Mathf.Infinity); // reset best score
		if (PlayerPrefs.GetString ("Name") == "") // first player
			PlayerPrefs.SetString ("Name", "Unknown Player");


	}
	
	// Update is called once per frame
	void Update () {
		//OVRManager.HMDUnmounted += OnHDUnmounted; // check VR headset state
	}

	//handle main menu button clicks
	public void buttonClicked(string id){
		effectsAudio.clip = onMenuSelect; // play select sound
		effectsAudio.Play();
		if (id == "StartButton") {
			startSimulator ();
		} else if (id == "CalibrateButton") {
			StartCoroutine (calibrateVR ());
		} else if (id == "LightningMode") {
			toggleLightning ();
		} else if (id == "QuitButton") {
			quitGame ();
		} else if (id == "BackToMenuButton") {
			restartGame ();
		} else if (id == "ChangeMapButton") {
			switchMap ();
		}


	}

	void OnHDUnmounted(){ // VR headset removed
		//modelControllerScript.isRunning=false;
		restartGame();
	}

	void showScore(){
		if (modelControllerScript.gameScore) {
			GameObject score = GameObject.Find ("scoreText");
			score.GetComponent<UnityEngine.UI.Text> ().text = "Best Time: "+PlayerPrefs.GetFloat("Score").ToString()+"\nBy "+ PlayerPrefs.GetString("Name"); // write to UI

		}
	}

	void initMap(){
		if (currentMap == "speedway") {
			raceMap.SetActive (false);
			speedwayMap.SetActive (true);
			currentMap = "speedway";
		} else {
			raceMap.SetActive (true);
			speedwayMap.SetActive (false);
			currentMap = "race_track";

			showScore ();
		}

	
	}

	void switchMap(){ // switch map
		
		//GameObject buttonText = GameObject.Find ("switchMapText");
		//mapText = buttonText.GetComponent<UnityEngine.UI.Text> ();

		if (currentMap == "race_track") {
			raceMap.SetActive (false);
			speedwayMap.SetActive (true);
			currentMap = "speedway";

		} else {
			raceMap.SetActive (true);
			speedwayMap.SetActive(false);
			currentMap = "race_track";

			// show best score on menu
			showScore ();

		}

	}

	//reset VR orientation
	public IEnumerator calibrateVR(){
		isCalibrating = true;
		GameObject buttonText = GameObject.Find ("calibrateText");
		calibrateText = buttonText.GetComponent<UnityEngine.UI.Text> ();
		calibrateText.text = "Look Straight Forward!";
		yield return new WaitForSeconds (3);
		InputTracking.Recenter();
		isCalibrating = false;
		calibrateTimer = 0;
		calibrateText.text = "Calibrate VR";

	}

	//toggle sun intensity
	public void toggleLightning(){
		GameObject sun = GameObject.Find("Sun");
		GameObject buttonText = GameObject.Find ("nightModeText"); 
		nightModeText = buttonText.GetComponent<UnityEngine.UI.Text> ();

		float intensity = daylightIntensity;
		if (daylight) {
			intensity = nightIntensity;
			daylight = false;
			nightModeText.text = "Daylight";
		} else {
			daylight = true;
			nightModeText.text = "Night Mode";
		}
		sun.GetComponent<UnityEngine.Light> ().intensity = intensity;
		modelControllerScript.setSpotlight(daylight);

	}

	// start game, remove menu, enable model script, send first ROS message
	public void startSimulator(){
		print ("Starting Simulator...");
		//InputTracking.Recenter(); // calibrate based on current user-orientation
		removeMenu();
		modelControllerScript.enabled = true; // start mc model
		StartCoroutine(fadeOutMusic());
		//send first ROS message to simulink with game settings
	}

	public void removeMenu(){
		GameObject reticle= GameObject.Find("GUIReticle");
		reticle.SetActive (false); // remove gaze pointer
		GameObject menu = GameObject.Find ("Menu");
		menu.SetActive (false); //disable menu

	}

	//exit application
	public void quitGame (){
		print ("Quitting Simulator...");
		if (Application.isEditor)
			UnityEditor.EditorApplication.isPlaying = false;
		else Application.Quit ();


	}

	public static void restartGame (){
		// reload the scene.
		SceneManager.LoadScene(SceneManager.GetActiveScene().name, LoadSceneMode.Single);
	}

	IEnumerator fadeOutMusic(){
		float delay = 1f; // fade out music delay
		float t = 0;
		float vol = musicAudio.volume;
		while (t < delay) {
			t += Time.deltaTime;
			musicAudio.volume = Mathf.Lerp(vol, 0, t/delay);
			yield return null;
		}
		musicAudio.Stop ();
	}

	void OnGUI() // get player name
	{
		if (modelControllerScript.goal && modelControllerScript.newScore) {
			GUI.color = Color.white;

			Rect rectObj = new Rect (UnityEngine.Screen.width/2 -15,380,200,400);
			GUIStyle style = new GUIStyle ();
			style.fontSize = 25;
			style.normal.textColor = Color.white;

			style.alignment = TextAnchor.UpperCenter;
			GUI.Box (rectObj, "Name of player", style);

			strMessage = GUI.TextField (new Rect (UnityEngine.Screen.width/2, 420, 140, 20), strMessage);
			GUI.backgroundColor = Color.black;

			GUI.color = Color.white;
			if (GUI.Button (new Rect (UnityEngine.Screen.width/2+150, 420, 40, 20), "Save")) {
				PlayerPrefs.SetString ("Name", strMessage); // save name of player
				restartGame();
			}     
		}
	}


}


