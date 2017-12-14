#ifndef _ROS_unity_package_Simulink2MotionPC_h
#define _ROS_unity_package_Simulink2MotionPC_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace unity_package
{

  class Simulink2MotionPC : public ros::Msg
  {
    public:
      typedef float _x_ddot_type;
      _x_ddot_type x_ddot;
      typedef float _y_ddot_type;
      _y_ddot_type y_ddot;
      typedef float _z_ddot_type;
      _z_ddot_type z_ddot;
      typedef float _roll_ddot_type;
      _roll_ddot_type roll_ddot;
      typedef float _pitch_ddot_type;
      _pitch_ddot_type pitch_ddot;
      typedef float _yaw_ddot_type;
      _yaw_ddot_type yaw_ddot;

    Simulink2MotionPC():
      x_ddot(0),
      y_ddot(0),
      z_ddot(0),
      roll_ddot(0),
      pitch_ddot(0),
      yaw_ddot(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      offset += serializeAvrFloat64(outbuffer + offset, this->x_ddot);
      offset += serializeAvrFloat64(outbuffer + offset, this->y_ddot);
      offset += serializeAvrFloat64(outbuffer + offset, this->z_ddot);
      offset += serializeAvrFloat64(outbuffer + offset, this->roll_ddot);
      offset += serializeAvrFloat64(outbuffer + offset, this->pitch_ddot);
      offset += serializeAvrFloat64(outbuffer + offset, this->yaw_ddot);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->x_ddot));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->y_ddot));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->z_ddot));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->roll_ddot));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->pitch_ddot));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->yaw_ddot));
     return offset;
    }

    const char * getType(){ return "unity_package/Simulink2MotionPC"; };
    const char * getMD5(){ return "f42ae6ddad2a7bc05f1d468d2ad4cc0f"; };

  };

}
#endif