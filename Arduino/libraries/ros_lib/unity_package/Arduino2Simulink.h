#ifndef _ROS_unity_package_Arduino2Simulink_h
#define _ROS_unity_package_Arduino2Simulink_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace unity_package
{

  class Arduino2Simulink : public ros::Msg
  {
    public:
      typedef float _steering_sensor_type;
      _steering_sensor_type steering_sensor;
      typedef float _acc_sensor_type;
      _acc_sensor_type acc_sensor;
      typedef float _brake_front_type;
      _brake_front_type brake_front;
      typedef float _brake_back_type;
      _brake_back_type brake_back;
      typedef int32_t _emergency_freeze_type;
      _emergency_freeze_type emergency_freeze;
      typedef int32_t _to_neutral_type;
      _to_neutral_type to_neutral;

    Arduino2Simulink():
      steering_sensor(0),
      acc_sensor(0),
      brake_front(0),
      brake_back(0),
      emergency_freeze(0),
      to_neutral(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_steering_sensor;
      u_steering_sensor.real = this->steering_sensor;
      *(outbuffer + offset + 0) = (u_steering_sensor.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_steering_sensor.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_steering_sensor.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_steering_sensor.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->steering_sensor);
      union {
        float real;
        uint32_t base;
      } u_acc_sensor;
      u_acc_sensor.real = this->acc_sensor;
      *(outbuffer + offset + 0) = (u_acc_sensor.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_acc_sensor.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_acc_sensor.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_acc_sensor.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->acc_sensor);
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
      } u_brake_back;
      u_brake_back.real = this->brake_back;
      *(outbuffer + offset + 0) = (u_brake_back.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_brake_back.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_brake_back.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_brake_back.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->brake_back);
      union {
        int32_t real;
        uint32_t base;
      } u_emergency_freeze;
      u_emergency_freeze.real = this->emergency_freeze;
      *(outbuffer + offset + 0) = (u_emergency_freeze.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_emergency_freeze.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_emergency_freeze.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_emergency_freeze.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->emergency_freeze);
      union {
        int32_t real;
        uint32_t base;
      } u_to_neutral;
      u_to_neutral.real = this->to_neutral;
      *(outbuffer + offset + 0) = (u_to_neutral.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_to_neutral.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_to_neutral.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_to_neutral.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->to_neutral);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_steering_sensor;
      u_steering_sensor.base = 0;
      u_steering_sensor.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_steering_sensor.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_steering_sensor.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_steering_sensor.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->steering_sensor = u_steering_sensor.real;
      offset += sizeof(this->steering_sensor);
      union {
        float real;
        uint32_t base;
      } u_acc_sensor;
      u_acc_sensor.base = 0;
      u_acc_sensor.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_acc_sensor.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_acc_sensor.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_acc_sensor.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->acc_sensor = u_acc_sensor.real;
      offset += sizeof(this->acc_sensor);
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
      } u_brake_back;
      u_brake_back.base = 0;
      u_brake_back.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_brake_back.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_brake_back.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_brake_back.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->brake_back = u_brake_back.real;
      offset += sizeof(this->brake_back);
      union {
        int32_t real;
        uint32_t base;
      } u_emergency_freeze;
      u_emergency_freeze.base = 0;
      u_emergency_freeze.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_emergency_freeze.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_emergency_freeze.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_emergency_freeze.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->emergency_freeze = u_emergency_freeze.real;
      offset += sizeof(this->emergency_freeze);
      union {
        int32_t real;
        uint32_t base;
      } u_to_neutral;
      u_to_neutral.base = 0;
      u_to_neutral.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_to_neutral.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_to_neutral.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_to_neutral.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->to_neutral = u_to_neutral.real;
      offset += sizeof(this->to_neutral);
     return offset;
    }

    const char * getType(){ return "unity_package/Arduino2Simulink"; };
    const char * getMD5(){ return "4e173c33e0758ea7211b5bab2745be52"; };

  };

}
#endif