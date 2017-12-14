#ifndef _ROS_unity_package_Simulink2Unity_h
#define _ROS_unity_package_Simulink2Unity_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace unity_package
{

  class Simulink2Unity : public ros::Msg
  {
    public:
      typedef float _roll_type;
      _roll_type roll;
      typedef float _pitch_type;
      _pitch_type pitch;
      typedef float _yaw_type;
      _yaw_type yaw;
      typedef float _speed_type;
      _speed_type speed;
      typedef float _rpm_type;
      _rpm_type rpm;
      typedef float _steering_angle_type;
      _steering_angle_type steering_angle;
      typedef float _brake_front_type;
      _brake_front_type brake_front;
      typedef float _throttle_type;
      _throttle_type throttle;
      typedef float _clutch_switch_type;
      _clutch_switch_type clutch_switch;
      typedef int32_t _gear_type;
      _gear_type gear;
      typedef int32_t _emergencyStop_type;
      _emergencyStop_type emergencyStop;

    Simulink2Unity():
      roll(0),
      pitch(0),
      yaw(0),
      speed(0),
      rpm(0),
      steering_angle(0),
      brake_front(0),
      throttle(0),
      clutch_switch(0),
      gear(0),
      emergencyStop(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_roll;
      u_roll.real = this->roll;
      *(outbuffer + offset + 0) = (u_roll.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_roll.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_roll.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_roll.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->roll);
      union {
        float real;
        uint32_t base;
      } u_pitch;
      u_pitch.real = this->pitch;
      *(outbuffer + offset + 0) = (u_pitch.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_pitch.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_pitch.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_pitch.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->pitch);
      union {
        float real;
        uint32_t base;
      } u_yaw;
      u_yaw.real = this->yaw;
      *(outbuffer + offset + 0) = (u_yaw.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_yaw.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_yaw.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_yaw.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->yaw);
      union {
        float real;
        uint32_t base;
      } u_speed;
      u_speed.real = this->speed;
      *(outbuffer + offset + 0) = (u_speed.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_speed.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_speed.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_speed.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->speed);
      union {
        float real;
        uint32_t base;
      } u_rpm;
      u_rpm.real = this->rpm;
      *(outbuffer + offset + 0) = (u_rpm.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_rpm.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_rpm.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_rpm.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->rpm);
      union {
        float real;
        uint32_t base;
      } u_steering_angle;
      u_steering_angle.real = this->steering_angle;
      *(outbuffer + offset + 0) = (u_steering_angle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_steering_angle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_steering_angle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_steering_angle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->steering_angle);
      union {
        float real;
        uint32_t base;
      } u_brake_front;
      u_brake_front.real = this->brake_front;
      *(outbuffer + offset + 0) = (u_brake_front.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_brake_front.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_brake_front.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_brake_front.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->brake_front);
      union {
        float real;
        uint32_t base;
      } u_throttle;
      u_throttle.real = this->throttle;
      *(outbuffer + offset + 0) = (u_throttle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_throttle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_throttle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_throttle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->throttle);
      union {
        float real;
        uint32_t base;
      } u_clutch_switch;
      u_clutch_switch.real = this->clutch_switch;
      *(outbuffer + offset + 0) = (u_clutch_switch.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_clutch_switch.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_clutch_switch.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_clutch_switch.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->clutch_switch);
      union {
        int32_t real;
        uint32_t base;
      } u_gear;
      u_gear.real = this->gear;
      *(outbuffer + offset + 0) = (u_gear.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_gear.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_gear.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_gear.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->gear);
      union {
        int32_t real;
        uint32_t base;
      } u_emergencyStop;
      u_emergencyStop.real = this->emergencyStop;
      *(outbuffer + offset + 0) = (u_emergencyStop.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_emergencyStop.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_emergencyStop.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_emergencyStop.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->emergencyStop);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_roll;
      u_roll.base = 0;
      u_roll.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_roll.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_roll.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_roll.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->roll = u_roll.real;
      offset += sizeof(this->roll);
      union {
        float real;
        uint32_t base;
      } u_pitch;
      u_pitch.base = 0;
      u_pitch.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_pitch.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_pitch.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_pitch.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->pitch = u_pitch.real;
      offset += sizeof(this->pitch);
      union {
        float real;
        uint32_t base;
      } u_yaw;
      u_yaw.base = 0;
      u_yaw.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_yaw.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_yaw.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_yaw.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->yaw = u_yaw.real;
      offset += sizeof(this->yaw);
      union {
        float real;
        uint32_t base;
      } u_speed;
      u_speed.base = 0;
      u_speed.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_speed.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_speed.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_speed.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->speed = u_speed.real;
      offset += sizeof(this->speed);
      union {
        float real;
        uint32_t base;
      } u_rpm;
      u_rpm.base = 0;
      u_rpm.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_rpm.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_rpm.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_rpm.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->rpm = u_rpm.real;
      offset += sizeof(this->rpm);
      union {
        float real;
        uint32_t base;
      } u_steering_angle;
      u_steering_angle.base = 0;
      u_steering_angle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_steering_angle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_steering_angle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_steering_angle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->steering_angle = u_steering_angle.real;
      offset += sizeof(this->steering_angle);
      union {
        float real;
        uint32_t base;
      } u_brake_front;
      u_brake_front.base = 0;
      u_brake_front.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_brake_front.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_brake_front.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_brake_front.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->brake_front = u_brake_front.real;
      offset += sizeof(this->brake_front);
      union {
        float real;
        uint32_t base;
      } u_throttle;
      u_throttle.base = 0;
      u_throttle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_throttle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_throttle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_throttle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->throttle = u_throttle.real;
      offset += sizeof(this->throttle);
      union {
        float real;
        uint32_t base;
      } u_clutch_switch;
      u_clutch_switch.base = 0;
      u_clutch_switch.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_clutch_switch.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_clutch_switch.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_clutch_switch.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->clutch_switch = u_clutch_switch.real;
      offset += sizeof(this->clutch_switch);
      union {
        int32_t real;
        uint32_t base;
      } u_gear;
      u_gear.base = 0;
      u_gear.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_gear.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_gear.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_gear.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->gear = u_gear.real;
      offset += sizeof(this->gear);
      union {
        int32_t real;
        uint32_t base;
      } u_emergencyStop;
      u_emergencyStop.base = 0;
      u_emergencyStop.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_emergencyStop.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_emergencyStop.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_emergencyStop.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->emergencyStop = u_emergencyStop.real;
      offset += sizeof(this->emergencyStop);
     return offset;
    }

    const char * getType(){ return "unity_package/Simulink2Unity"; };
    const char * getMD5(){ return "1a86d424b11d4cdea8da7885be21b90f"; };

  };

}
#endif