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
