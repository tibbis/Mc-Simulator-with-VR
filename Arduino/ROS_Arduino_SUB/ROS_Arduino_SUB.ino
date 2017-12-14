#include <ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Int8.h>                            //TESTHZ


  #include <SoftwareSerial.h>       // Hbridge lib
  #include <SabertoothSimplified.h> // Hbridge lib
  SoftwareSerial SWSerial(NOT_A_PIN, 6); // RX on no pin (unused), TX on pin 11 (to S1).
  SabertoothSimplified ST(SWSerial); // Use SWSerial as the serial port.
  
  ros::NodeHandle nh; // Initiate Node handle, allows the program to create pub and sub, takes care of serial port communicatoin

  std_msgs::Int8 emptymsg;                            //TESTHZ
  ros::Publisher testhz("testhz", &emptymsg);         //TESTHZ

// ############################# Torque Controller ####################################################
  long enc_count = 0; 
  long enc_count_old = 0;
  int dir=0;
  long deltaT=0;
  long time_old = 0;
  long time_new = 1;  // divide by 0 if set to zero [us]
  int interrupt_flag;

  float Kp=0.3;         // P-part of PI-controller 0.3
  float Ki=100;         // I-part of PI-controller 1000
  float Ts=1/200;       // Sample time (180Hz)
  
  float Gearing=6.25*4; // Gear ratio
  float R=0.6;          // Motor constant (from datasheet)
  
  float Kt=6.4*0.01;    // Torque constant on motor 
  float Ke=Kt; 
  
  float a=Kp+Ki*Ts/2;   // Constant for the controller
  float b=-Kp+Ki*Ts/2;  // constant for the controller 
  
  // Used for saving old variables and init new variables
    float U=0;
    float U1=0;
    float e=0;
    float e1=0;
  
  // Constants 
    float pi=3.14159265359;
    int duty=0;    // Used to calculate PWM-duty cycle 
    float ref=0;  // Input from model, specifies handlebar torque feedback and direction  
    //Subscribe on ref
    float radps=0; // variable to keep track on current speed 
// ####################################################################################################
  
void torqueCb( const std_msgs::Float32& toggle_msg){
  ref = toggle_msg.data;
  }
  
ros::Subscriber<std_msgs::Float32> sub("torque_control", &torqueCb );



void setup()
{
  cli(); //dissable interrupts
  nh.getHardware()->setBaud(115200);


    
  SWSerial.begin(9600); // Init Sabertooth h-bridge 
  //Serial.begin(115200); // Init baudrate 
   
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(testhz);                                 //TESTHZ
  delay(100);
  sei(); //enable interrupts
  //Torque Controller/////////////////////////////////////////////////////////////////////////////////////////////  
   // Init interups from encoder signal A and B
   // A-signal
    attachInterrupt(0, encoder_isr, RISING);
    pinMode(2, INPUT);
   // B-signal
    attachInterrupt(1, encoder_isr, RISING); 
    pinMode(3, INPUT);
}





/*
 * Interupt function
 */
void encoder_isr() {
  static int8_t lookup_table[] = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0};//{0,0,0,-1,0,0,1,0,0,1,0,0,-1,0,0,0};;//
  static uint8_t enc_val = 0; 
  enc_val |= enc_val << 2;                                 // Bitshift old values
  enc_val |= enc_val | (PINE & 0b0110000)>>4 ;             // get new values
  enc_count |= enc_count + lookup_table[enc_val & 0b1111]; // Lookup table fancy pants.
  interrupt_flag = 1;
}

/*
 * Feedback controller function that calculates duty based on reference torwue and current rotational speed as inputs. 
 */
float controller(float ref, float radps) {
  if (ref < -50)
    ref = -50;
  if (ref > 50)
    ref = 50;
    
  e=ref-Gearing*Kt*(U1-Ke*radps)/R; // error against reference torque
  U=U1+a*e+b*e1; // Converts error e to Voltage U (PI-controller)

  // Voltage saturation 
    if (U>24){
      U=24;
    }
    else if (U<-24){
      U=-24;
    }
  e1=e; // Save current error for next loop
  U1=U; // Save current voltage for next loop
  duty=(U*127)/24; // Convert [-24,24] -> [-127,127]
  return duty;  
}

/*
 * Speed calculation based on encoder values and time 
 */
float calcSpeed(){
  time_new = micros();
  deltaT = time_new-time_old;
  time_old = time_new;
  radps=((enc_count-enc_count_old))*((2.0*pi*1000*1000)/(12*deltaT));
  enc_count_old = enc_count;
  return radps; 
}

void loop()
{  

// Torque Controller/////////////////////////////////////////////////////////////////////////////////////////////  
  radps=calcSpeed();              // calculate speed 
  int out=controller(ref, radps); // Calculate duty cycle 
  ST.motor(1, out);               // Set PWM to H-bridge 
  
  emptymsg.data = out; //ref still works
  
  nh.spinOnce();
  testhz.publish(& emptymsg);                              //TESTHZ
  delay(15); //delay(8)=105hz delay(3)= 200hz



}
  
  
  




