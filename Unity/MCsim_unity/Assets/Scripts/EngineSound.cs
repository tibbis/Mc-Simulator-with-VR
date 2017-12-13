using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//For a clean loop use wav form at the highest resolution with fixed update
//if it is still not clean see how Umity imports the sound


//Snippet of code that should be attached to the motor cycle object
//Another way to add sound would be with an animator crontroller

//You can play a single audio clip using Play, Pause and Stop.
//You can also adjust its volume while playing using the volume property, or seek using time.
//Multiple sounds can be played on one AudioSource using PlayOneShot

//Comment:using audio clips insteaf of audiosources barerely save any
//Computational cost. Audio clips are useful for the play once function though

public class EngineSound : MonoBehaviour {

	modelController modelControllerScript;

    public float maxRPM = 14000; //Nm, 110Nm seems reasonable
    public int Gear_up = 0; public int Gear_down = 0;
    public int Ignite_engine = 0; public int Kill_engine = 0; public int Engine_online = 0;
    //For testing purposes this is an undefined variable and can be
    //changed directly in unity. currenTorque should for future use
    //be accessed from the actual motorcycle object and not the unity window
    public float currentRPM;
    //public int[] gearRatio;
	public int gear;
    //public bool highRPM, midRPM, lowRPM;
	private int oldGear = 0;
	//private AudioSource currentSource;
	private bool isBraking = false;

	public float startingPitch = 0.4f;

    //Each AudioSource Carries an audio clip
    AudioSource ignition;
    //AudioSource motor_running; //idle, find linear ac clater
    AudioSource shiftDown;
    AudioSource shiftUp;
    //AudioSource LoopRPM3000;
    //AudioSource LoopRPM6000;
	AudioSource RPM4000, brake;
	private float time_since_brake=0;
	private float brake_timeout=3f; // seconds
    // Use this for initialization
    void Start() {
			GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
			modelControllerScript = mc.GetComponent<modelController>(); // mc script

	        //gearRatio = new int[] { 900, 1880, 3400, 5800, 8850, 10000, 13000 };
	        //AudioSource = GetComponent<AudioSource>();
	    AudioSource[] audios = GetComponents<AudioSource>();

	        //Grab audioclip from sources, same numbering as the unity order!
			RPM4000 = audios[0];
	    shiftUp = audios[1];
	    ignition = audios[2];
	    shiftDown = audios[3];
			brake = audios[6];

			gear = 0;//Neutral gear
			oldGear = gear;

    }

    // Update is called once per frame
    void FixedUpdate() {

        engineSound();//Updates the sound of the engine

    }



    void engineSound() {
		currentRPM = modelControllerScript.rpm; // get rpm
		gear = modelControllerScript.gear; // get gear

		if (!modelControllerScript.isRunning && Engine_online == 1 || currentRPM==0) { // closing motor
			Engine_online = 0;
			Kill_engine = 0;
			RPM4000.Stop();

		} else if (modelControllerScript.isRunning && Engine_online == 0) { // // starting motor
			ignition.Play ();
			Ignite_engine = 0;//Add another bool to make motor running an option whilst on

			StartCoroutine(fadeIn (RPM4000)); // crossfade sound
			//This is to start the loop for motor, cannot be called too often (restarts instead of loops)

			Engine_online = 1;
		}
		if (modelControllerScript.isRunning){
			changeGearSound (); // gearing sound effect
			brakeSound(); // brake sound effect
		}

		if (modelControllerScript.isRunning) {

			RPM4000.pitch=(3*currentRPM/(maxRPM)) + startingPitch; // pitch the motor sound after the current rpm

		}
	}


	// fade in sounds
	IEnumerator fadeIn(AudioSource sound){

		float delay = 0.2f; // fade out  delay
		float t = 0;
		float vol = 0;
		sound.Play ();

		while (t < delay) {
			t += Time.deltaTime;
			sound.volume = Mathf.Lerp(vol, 1f, t/delay); // fade out
			yield return null;
		}

	}

	IEnumerator fadeOut(AudioSource sound, float delay){
		float t = 0;
		float vol = sound.volume;
		while (t < delay) {
			t += Time.deltaTime;
			sound.volume = Mathf.Lerp(vol, 0, t/delay);
			yield return null;
		}
		sound.Stop ();
		sound.volume = 1f;
	}

	void changeGearSound(){

		if (gear < oldGear) { // gear  down
			shiftDown.Play ();
			Gear_down = 0;

		} else if (gear > oldGear) { // gear up
			shiftUp.Play ();
			Gear_up = 0;
		}
		oldGear = gear; // save old gear value
	}

	void brakeSound(){

		if (modelControllerScript.brake_front > 0.3f) { // braking hard
			if (!isBraking) { // not already playing and timeout limit // && (Time.deltaTime-time_since_brake >= brake_timeout)
				brake.volume = 1f;
				brake.Play ();
				isBraking = true;
				//time_since_brake = Time.deltaTime;
			}
			brake.pitch = modelControllerScript.brake_front;
		} else if (brake.isPlaying && modelControllerScript.brake_front < 0.3f) { // not braking
			fadeOut (brake, 0.3f);
			isBraking = false;

		}
	}




}
