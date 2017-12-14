#include <ros.h>
#include <ros/time.h>
#include <unity_package/Arduino2Simulink.h>
#include <unity_package/Simulink2Arduino.h>
#include <std_msgs/Float32.h>

// H-bridge 
//  #include <SoftwareSerial.h>       // Hbridge lib
//  #include <SabertoothSimplified.h> // Hbridge lib
//  SoftwareSerial SWSerial(NOT_A_PIN, 6); // RX on no pin (unused), TX on pin 11 (to S1).
//  SabertoothSimplified ST(SWSerial); // Use SWSerial as the serial port.

ros::NodeHandle nh; // Initiate Node handle, allows the program to create pub and sub, takes care of serial port communicatoin
unity_package::Arduino2Simulink messagearray;
//unity_package::Simulink2Arduino toggle_msg;
ros::Publisher arduino_sensor_topic("arduino_sensor_topic", &messagearray);

const int analog_acc_pin = A0;  // Acceleration
const int analog_steer_pin = A1; // Steering
const int analog_brake_front_pin = A3;
const int analog_brake_back_pin = A2; // Red, Green, Blue
//const int analog_emergency_freeze;
const int analog_to_neutral_pin = 5;
//const int analog_gear_up;
//const int analog_gear_down;
//const int analog_clutch;

float steering_sensor = 0;
float acc_sensor = 0;
float brake_front = 0;
float brake_back = 0;
int emergency_freeze = 0;
int to_neutral = 0;

int to_engage = 0; 
long time1, time2;
int switch1;

int sensorvalue_acc_sensor;
int sensorvalue_steering_sensor;
int sensorvalue_brake_front;
int sensorvalue_brake_back;
//int sensorvalue_to_neutral_button

float steering_value = 0;
float acc_value = 0;
float brake_front_value = 0;
float brake_back_value = 0;
long last_sent=0;

// ############################# Torque Controller ####################################################
//  long enc_count = 0; 
//  long enc_count_old = 0;
//  int dir=0;
//  long deltaT=0;
//  long time_old = 0;
//  long time_new = 1;  // divide by 0 if set to zero [us]
//  int interrupt_flag;
//
//  float Kp=0.34;         // P-part of PI-controller 0.3
//  float Ki=100;         // I-part of PI-controller 1000
//  float Ts=1/80;       // Sample time (180Hz)
//  
//  float Gearing=6.25*4; // Gear ratio
//  float R=0.6;          // Motor constant (from datasheet)
//  
//  float Kt=6.4*0.01;    // Torque constant on motor 
//  float Ke=Kt; 
//  
//  float a=Kp+Ki*Ts/2;   // Constant for the controller
//  float b=-Kp+Ki*Ts/2;  // constant for the controller 
//  
//  // Used for saving old variables and init new variables
//    float U=0;
//    float U1=0;
//    float e=0;
//    float e1=0;
//  
//  // Constants 
//    float pi=3.14159265359;
//    int duty=0;    // Used to calculate PWM-duty cycle 
//    float ref=0;  // Input from model, specifies handlebar torque feedback and direction  
//    //Subscribe on ref
//    float radps=0; // variable to keep track on current speed 
//// ####################################################################################################
//  
//void torqueCb( const std_msgs::Float32& toggle_msg){
//  ref = toggle_msg.data;
//  }
//  
//ros::Subscriber<std_msgs::Float32> sub("torque_control", &torqueCb );
//   

void setup()
{
  nh.getHardware()->setBaud(115200);
  nh.initNode();
  nh.advertise(arduino_sensor_topic);
  //nh.subscribe(sub);
  
////Torque Controller/////////////////////////////////////////////////////////////////////////////////////////////  
//   // Init interups from encoder signal A and B
//   // A-signal
//    attachInterrupt(0, encoder_isr, RISING);
//    pinMode(2, INPUT);
//   // B-signal
//    //attachInterrupt(1, encoder_isr, RISING); 
//    //pinMode(3, INPUT);
//    
//  SWSerial.begin(9600); // Init Sabertooth h-bridge 
//  //Serial.begin(115200); // Init baudrate 
  delay(100);
}


///*
// * Interupt function
// */
//void encoder_isr() {
//  static int8_t lookup_table[] = {0,0,0,-1,0,0,1,0,0,1,0,0,-1,0,0,0};;//{0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0}
//  static uint8_t enc_val = 0; 
//  enc_val = enc_val << 2;                                 // Bitshift old values
//  enc_val = enc_val | (PINE & 0b0110000)>>4 ;             // get new values
//  enc_count = enc_count + lookup_table[enc_val & 0b1111]; // Lookup table fancy pants.
//  interrupt_flag = 1;
//}
//
///*
// * Feedback controller function that calculates duty based on reference torwue and current rotational speed as inputs. 
// */
//float controller(float ref, float radps) {
//  if (ref < -40)
//    ref = -40;
//  if (ref > 40)
//    ref = 40;
//    
//  e=ref-Gearing*Kt*(U1-Ke*radps)/R; // error against reference torque
//  U=U1+a*e+b*e1; // Converts error e to Voltage U (PI-controller)
//
//  // Voltage saturation 
//    if (U>24){
//      U=24;
//    }
//    else if (U<-24){
//      U=-24;
//    }
//  e1=e; // Save current error for next loop
//  U1=U; // Save current voltage for next loop
//  duty=(U*127)/24; // Convert [-24,24] -> [-127,127]
//  return duty;  
//}
//
///*
// * Speed calculation based on encoder values and time 
// */
//float calcSpeed(){
//  time_new = micros();
//  deltaT = time_new-time_old;
//  time_old = time_new;
//  radps=((enc_count-enc_count_old))*((2.0*pi*1000*1000)/(12*deltaT));
//  enc_count_old = enc_count;
//  return radps; 
//}


void loop()
{  
  arduino_sensor_topic.publish(& messagearray);
  nh.spinOnce();
  
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
  steering_value =  ((sensorvalue_steering_sensor-532.0)*70/1023);
  if (steering_value < -35)
  {
    steering_value = -35;
  }
  if (steering_value > 35)
  {
    steering_value = 35;
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
  brake_back_value = 1-(sensorvalue_brake_back-746)/89.0;   
  
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
  
  
  switch1 = 1 - digitalRead(analog_to_neutral_pin); //0 for open circuit and 1 for closed circuit
  if (switch1 == 1){ 
    to_neutral = 1;
  }
  if (switch1 == 0 && to_neutral < 2){
    to_neutral = 3;
    time1 = millis();
  }  
  
  if(to_neutral == 3){
    time2 = millis();
    if ((time2-time1)>=7000){
      to_neutral = 7;
    }
  }
  messagearray.to_neutral = to_neutral;
  
  delay(5); //6 gives 106Hz ca:15min runtime, 7 gives 97Hz ca:4min run time
//  
//// Torque Controller/////////////////////////////////////////////////////////////////////////////////////////////  
//  radps=calcSpeed();              // calculate speed 
//  int out=controller(ref, radps); // Calculate duty cycle 
//  ST.motor(1, out);               // Set PWM to H-bridge 
}

