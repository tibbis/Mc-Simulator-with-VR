#include <ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Float64.h>

ros::NodeHandle  nh; 

std_msgs::Float64 floatmsg;
std_msgs::Float64 floatmsg2;
ros::Publisher arduino_throttle("arduino_throttle", &floatmsg);
ros::Publisher arduino_steering("arduino_steering", &floatmsg2);

float treatedvalue_throttle = 0;
float treatedvalue_steering = 0;


const int analogInPin = A0;
const int analogInPin2 = A1; //Steering

int sensorvalue_throttle = 0;
int sensorValue_steering = 0;

void setup()
{
  nh.initNode();
  nh.advertise(arduino_throttle);
  nh.advertise(arduino_steering);
}

void loop()
{
  sensorvalue_throttle = analogRead(analogInPin);
  sensorValue_steering = analogRead(analogInPin2); //Max:733 MIN:424
  
  treatedvalue_throttle = (1-sensorvalue_throttle/(1024.0))/0.9;
  treatedvalue_steering = 300.0/1023.0*(sensorValue_steering-579)*-1.0;//(sensorValue_steering-512)*35.0 /512;
  
  floatmsg.data = treatedvalue_throttle;
  arduino_throttle.publish( & floatmsg);
  
  floatmsg2.data = treatedvalue_steering;
  arduino_steering.publish( & floatmsg2);
  
  
  nh.spinOnce();
  //10 gives 93Hz
}
