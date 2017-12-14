#include <ros.h>
#include <ros/time.h>
#include <unity_package/Arduino2Simulink.h>
#include <unity_package/Simulink2Arduino.h>
#include <std_msgs/Float32.h>

ros::NodeHandle nh; // Initiate Node handle, allows the program to create pub and sub, takes care of serial port communicatoin

float ref=0;  // Input from model, specifies handlebar torque feedback and direction 
float potentvalue=0;

void torqueCb( const std_msgs::Float32& toggle_msg){
  ref = toggle_msg.data;
  }
  
void potenvalCb(const unity_package::Arduino2Simulink& messagearray){
  potentvalue = messagearray.steering_sensor;
}


ros::Subscriber<std_msgs::Float32> subtorque("torque_control", &torqueCb );
ros::Subscriber<unity_package::Arduino2Simulink> subpotent("arduino_sensor_topic", &potenvalCb );

void setup()
{
  nh.getHardware()->setBaud(115200);
  nh.initNode();
  nh.subscribe(subtorque);
  nh.subscribe(subpotent);
  
  
    delay(100);
}

void loop()
{  
  
  nh.spinOnce(); 
  delay(5); //delay(8)=105hz delay(3)= 200hz
}
  
