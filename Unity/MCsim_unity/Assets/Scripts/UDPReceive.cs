/*
 
    -----------------------
    UDP-Receive (send to)
    -----------------------
    // [url]http://msdn.microsoft.com/de-de/library/bb979228.aspx#ID0E3BAC[/url]
   
   
    // > receive
    // 127.0.0.1 : 8051
   
    // send
    // nc -u 127.0.0.1 8051
 
*/
using UnityEngine;
using System.Collections;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class UDPReceive : MonoBehaviour {


	// receiving Thread
	Thread receiveThread;

	// udpclient object
	UdpClient client;

	// public
	// public string IP = "127.0.0.1"; default local
	public int port; // define > init

	// infos
	public string lastReceivedUDPPacket="";
	public string allReceivedUDPPackets=""; // clean up this from time to time!


	// start from shell
//	private static void Main()
//	{
//		UDPReceive receiveObj=new UDPReceive();
//		receiveObj.init();
//
//		string text="";
//		do
//		{
//			text = Console.ReadLine();
//		}
//		while(!text.Equals("exit"));
//	}
	modelController modelScript;
	// start from unity3d
	public void Start()
	{
		GameObject mc = GameObject.Find("Motorcycle"); // get mc gameobject
		modelScript = mc.GetComponent<modelController>(); // get the model controller script attached

		init();
	}

	// OnGUI
	void OnGUI()
	{
		Rect rectObj=new Rect(40,10,200,400);
		GUIStyle style = new GUIStyle();
		style.alignment = TextAnchor.UpperLeft;
//		GUI.Box(rectObj,"# UDPReceive\n127.0.0.1 "+port+" #\n"
//			+ "shell> nc -u 127.0.0.1 : "+port+" \n"
//			+ "\nLast Packet: \n"+ lastReceivedUDPPacket
//			+ "\n\nAll Messages: \n"+allReceivedUDPPackets
//			,style);
	}

	// init
	private void init()
	{
		// Endpunkt definieren, von dem die Nachrichten gesendet werden.
		print("UDPSend.init()");

		// define port
		//port = 8051;

		// status
		print("Sending to 127.0.0.1 : "+port);
		print("Test-Sending to this Port: nc -u 127.0.0.1  "+port+"");


		// ----------------------------
		// Abhören
		// ----------------------------
		// Lokalen Endpunkt definieren (wo Nachrichten empfangen werden).
		// Einen neuen Thread für den Empfang eingehender Nachrichten erstellen.
		receiveThread = new Thread(
			new ThreadStart(ReceiveData));
		receiveThread.IsBackground = true;
		receiveThread.Start();

	}

	// receive thread interrupt
	private void ReceiveData()
	{
		
		client = new UdpClient(port);
		//client.EnableBroadcast = true;
		while (true)
		{
			try
			{
				// Bytes recieved.
				IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0); // change this to only one ip
				byte[] data = client.Receive(ref anyIP);

				// encode to string
				//string text = Encoding.ASCII.GetString(data);

				int[] modelState = new int[6];
				// save the message in to array
				modelState[0]=(data[0]-1)*data[1]; // sign*value
				modelState[1]=(data[2]-1)*data[3]; // sign*value
				modelState[2]=(data[4]-1)*data[5]; // sign*value
				modelState[3]=(data[6]-1)*data[7]; // sign*value
				modelState[4]=(data[8]-1)*data[9]; // sign*value
				modelState[5]=(data[10]-1)*data[11]; // sign*value
				//modelScript.model_state=modelState; // pass in to the public array in model script


				// latest UDPpacket
				//lastReceivedUDPPacket=text;

				// ....
				//allReceivedUDPPackets=allReceivedUDPPackets+text;

			}
			catch (Exception err)
			{
				print(err.ToString());
			}
		}
	}

	// getLatestUDPPacket
	// cleans up the rest
	public string getLatestUDPPacket()
	{
		allReceivedUDPPackets="";
		return lastReceivedUDPPacket;
	}

	void OnApplicationQuit () {

		if (receiveThread.IsAlive) {
			receiveThread.Abort();
		}
		client.Close(); 
	}
}