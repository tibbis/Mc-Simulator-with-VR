// Hatic Feedback controller
// 2017-11-18
// Gustav Sten

#include <SoftwareSerial.h>
#include <SabertoothSimplified.h>
#include <Arduino.h>
SoftwareSerial SWSerial(NOT_A_PIN, 4); // RX on no pin (unused), TX on pin 11 (to S1).
SabertoothSimplified ST(SWSerial); // Use SWSerial as the serial port.

// Init encoder
  long enc_count = 0; 
  long enc_count_old = 0;
  int dir=0;
  long deltaT=0;
  long time_old = 0;
  long time_new = 1;   // divide by 0 if set to zero [us]
  int interrupt_flag;

float Kp=0.3;         // P-part of PI-controller 
float Ki=100;         // I-part of PI-controller
float Ts=1/180;       // Sample time (180Hz)

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
  float ref=-12;  // Input from model, specifies handlebar torque feedback and direction  
  //Subscribe on ref
  float radps=0; // variable to keep track on current speed 



void setup() {
  // Init interups from encoder A and B signal
   // A-signal
    attachInterrupt(0, encoder_isr, CHANGE);
    pinMode(2, INPUT);
   // B-signal
    attachInterrupt(1, encoder_isr, CHANGE);
    pinMode(3, INPUT);
    
  SWSerial.begin(9600); // Init Sabertooth h-bridge 
  Serial.begin(115200); // Init baudrate 
}

/*
 * Interupt function
 */
void encoder_isr() {
  static int8_t lookup_table[] = {0,-1,1,0,1,0,0,-1,-1,0,0,1,0,1,-1,0};//{0,0,0,-1,0,0,1,0,0,1,0,0,-1,0,0,0};
  static uint8_t enc_val = 0; 
  enc_val = enc_val << 2;                                 // Bitshift old values
  enc_val = enc_val | (PINE & 0b0110000)>>4 ;             // get new values
  enc_count = enc_count + lookup_table[enc_val & 0b1111]; // Lookup table fancy pants.
  interrupt_flag = 1;
}

/*
 * Feedback controller function that calculates duty based on reference torwue and current rotational speed as inputs. 
 */
float controller(float ref, float radps) {
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
  radps=((enc_count-enc_count_old))*((2.0*pi*1000*1000)/(48*deltaT));
  enc_count_old = enc_count;
  return radps; 
}

void loop() {
  radps=calcSpeed();              // calculate speed 
  int out=controller(ref, radps); // Calculate duty cycle 
  ST.motor(1, out);               // Set PWM to H-bridge 
}


