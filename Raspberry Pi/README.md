# Raspberry Pi code

Our Structure:
A copy of how the ROS packages are placed and structured.

The names of the workspaces and packages are not very accurate.

catkin_MCSIM: Contains the package master which is used for the launch file.

catkin_Simulink: Contains the unity_package, this package handles the custom messages.

This could be merged into one package, and the name of package should probalby just be catkin_ws,
as we only need one workspace.

There are no actual nodes on the RPI that are being used.


Launch File:
This file is used to launch the ROS serial for the arduino connected to ACM0.
BaudRate and NodeName is also set in this file.

ROS bridge which connects to Unity3D.


Custom_messages:
All the custom messages that are used in the ROS network.



ROS Documentation
Documentation on how to start-up the RPI and ROS master.
Links to Basic ROS tutorials
Core ROS Tutorials: http://wiki.ros.org/ROS/Tutorials
Linux basics: http://www.ee.surrey.ac.uk/Teaching/Unix/

There is a Troubleshooting page at the end of this document.
1.	Plugin the System
ROS master runs on the RPI located in the locker, plug in the ethernet cable, Arduino and power supply (Optional to plugin HDMI, mouse and keyboard).
2.	Connecting to the RPI
Two ways to SSH to the RPI:
SSH the RPI through the Host PC using putty, open putty and load the save session “MCSIM RPI” (Password: New4you).
SSH the RPI through Eduroam from any computer, this IP address is dynamic and at the time “130.229.176.24”. username: mcsim password: New4you.
3.	Starting ROS
The ROS system consists of 3 nodes, Simulink, Unity3D and the Arduino. Beyond that, you need to start the ROS master so all the nodes can connect to the master.
Starting the ROS Master
3 steps to start the master and its containing protocols. There is a Easy start-up and a manual start-up.
1.	Starting the ROS core on the master
2.	Starting the ROS bridge protocol which handles the communication with Unity
3.	Starting the ROS serial protocol which handles the communication with the Arduino.
Easy start-up: write “roslaunch master system.launch” in the bash.
One command which will run a launch file, this presumes that everything is connected properly. Command: “roslaunch master system.launch”, this launch file is located in the master package. The master package is in the “catkin_MCSIM” folder.
Manual start-up: 
Start the ROS core writing “roscore” in bash.
Start the ROS bridge writing “roslaunch rosbridge_server rosbridge_websocket.launch” in bash.
Start ROS serial writing “rosrun rosserial_python serial_node.py /dev/ttyACM0” (Make sure the right port is setup) in bash.

Starting ROS in Matlab/Simulink
Open MC model 
ROS Workspace – Map structure
ROS works inside a workspace, where you have the packages and these packages contains the nodes that will be the subscriber/publisher.  Furthermore, the packages include the custom messages needed for the nodes inside the package. 
Unity Package
In Unity3D the nodes are configured locally using C#, to publish you extract what you want from the game model and the convert it in a way that it can be understood in the ROS network. The custom messages are also programmed in C#. The same goes for subscriptions, you subscribe to a topic in ROS and then you convert it in a way that it can be connected to an object in Unity3D
Matlab/Simulink Package
In Matlab/Simulink you can use the publish/subscribe blocks in Simulink. To make custom messages, you need to create the message in a ROS environment and then use a plugin to convert them to (Matlab/Simulink).
Arduino Package
The Arduino Environment is controlled from the IDE on the RPI. Rosserial is installed on the RPI ROS as a plugin and is used to communicate with the Arduino. 



