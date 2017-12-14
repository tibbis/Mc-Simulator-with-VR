# Arduino code
This is the sketchbook folder on the RPI

The sketchbook folder will be created when you install the arduino IDE

ROS_Arduino_PUB:
Contains the publishing node that is placed on one arduino Mega
This node publishes all the sensor readings on the MC

ROS_Arduino_SUB:
Contains the subscribing node that is placed on a second arduino Mega
This node subscribes on some variables on the ROS network and uses them to conrtol the H-bridge
The H-bridge controlls the motor on the steering.

ROS_Arduino_SUB2:
This code is not currentley used, it was created to use the potentiometer on the steering instead of the encoder.

Libraries:
The libraries contains all the custom messages that are used in the network.

Feedback_motor_NoROS:
The first code for the motor, this script does not connect itself to the ROS network

