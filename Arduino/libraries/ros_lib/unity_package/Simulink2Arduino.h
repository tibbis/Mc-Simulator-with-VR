#ifndef _ROS_unity_package_Simulink2Arduino_h
#define _ROS_unity_package_Simulink2Arduino_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace unity_package
{

  class Simulink2Arduino : public ros::Msg
  {
    public:
      typedef float _torque_reference_type;
      _torque_reference_type torque_reference;

    Simulink2Arduino():
      torque_reference(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_torque_reference;
      u_torque_reference.real = this->torque_reference;
      *(outbuffer + offset + 0) = (u_torque_reference.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_torque_reference.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_torque_reference.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_torque_reference.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->torque_reference);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_torque_reference;
      u_torque_reference.base = 0;
      u_torque_reference.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_torque_reference.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_torque_reference.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_torque_reference.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->torque_reference = u_torque_reference.real;
      offset += sizeof(this->torque_reference);
     return offset;
    }

    const char * getType(){ return "unity_package/Simulink2Arduino"; };
    const char * getMD5(){ return "b553eb5fddc8e8c8cb9caa506e3fefe4"; };

  };

}
#endif