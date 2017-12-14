#include <ros.h>
#include <unity_package/Arduino2Simulink.h>

ros::NodeHandle  nh;



unity_package::Arduino2Simulink messagearray;
ros::Publisher arduino_sensor_topic("arduino_sensor_topic", &messagearray);

const int analog_acc_pin = A0;  //Acceleration
const int analog_steer_pin = A1; //Steering
const int analog_brake_front_pin = A3;
const int analog_brake_back_pin = A2; //Red, Green, Blue
//const int analog_emergency_freeze;
//const int analog_to_neutral;
//const int analog_gear_up;
//const int analog_gear_down;
//const int analog_clutch;

float steering_sensor = 0;
float acc_sensor = 0;
float brake_front = 0;
float brake_back = 0;
boolean emergency_freeze = false;
boolean to_neutral = false;
int gear_up = 0;
int gear_down = 0;
int clutch = 0;

int sensorvalue_acc_sensor;
int sensorvalue_steering_sensor;
int sensorvalue_brake_front;
int sensorvalue_brake_back;

float steering_value = 0;
float acc_value = 0;
float brake_front_value = 0;
float brake_back_value = 0;


void setup()
{
  nh.getHardware()->setBaud(115200);
  nh.initNode();
  nh.advertise(arduino_sensor_topic);
  
}

void loop()
{
  
  sensorvalue_acc_sensor = analogRead(analog_acc_pin);
  acc_value = sensorvalue_acc_sensor/320.0;
  if (acc_value < 0)
  {
    acc_value = 0;
  }
  if (acc_value > 1)
  {
  acc_value = 1;
  }
  messagearray.acc_sensor = acc_value;
  
  
  sensorvalue_steering_sensor = analogRead(analog_steer_pin); //Max:733 MIN:424
  steering_value =  ((sensorvalue_steering_sensor-336)*300.0/1023)-33;
  if (steering_value < -40)
  {
    steering_value = -40;
  }
  if (steering_value > 40)
  {
    steering_value = 40;
  }  
  messagearray.steering_sensor =  steering_value;
  
  
  
  sensorvalue_brake_front = analogRead(analog_brake_front_pin);
  brake_front_value = (sensorvalue_brake_front-453.0)/81.0;  
    if (brake_front_value < 0)
  {
    brake_front_value = 0;
  }
  if (brake_front_value > 1)
  {
    brake_front_value = 1;
  }
  messagearray.brake_front = brake_front_value;
  
  
  sensorvalue_brake_back = analogRead(analog_brake_back_pin);
  brake_back_value = (sensorvalue_brake_back-186)/89.0;   
  
      if (brake_back_value < 0)
  {
    brake_back_value = 0;
  }
  if (brake_back_value > 1)
  {
    brake_back_value = 1;
  }
  messagearray.brake_back = brake_back_value;
  messagearray.emergency_freeze = emergency_freeze;
  messagearray.to_neutral = to_neutral;
  messagearray.gear_up = gear_up;
  messagearray.gear_down = gear_down;  
  messagearray.clutch  = clutch;  
  
  arduino_sensor_topic.publish(& messagearray);
  nh.spinOnce();
  //delay(2); //10 gives 93Hz
}

