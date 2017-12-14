#ifndef _ROS_unity_package_Unity2Simulink_h
#define _ROS_unity_package_Unity2Simulink_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace unity_package
{

  class Unity2Simulink : public ros::Msg
  {
    public:
      typedef bool _running_type;
      _running_type running;
      typedef bool _offroad_type;
      _offroad_type offroad;
      typedef int32_t _crash_type;
      _crash_type crash;
      typedef float _incline_type;
      _incline_type incline;
      typedef float _leaning_type;
      _leaning_type leaning;

    Unity2Simulink():
      running(0),
      offroad(0),
      crash(0),
      incline(0),
      leaning(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        bool real;
        uint8_t base;
      } u_running;
      u_running.real = this->running;
      *(outbuffer + offset + 0) = (u_running.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->running);
      union {
        bool real;
        uint8_t base;
      } u_offroad;
      u_offroad.real = this->offroad;
      *(outbuffer + offset + 0) = (u_offroad.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->offroad);
      union {
        int32_t real;
        uint32_t base;
      } u_crash;
      u_crash.real = this->crash;
      *(outbuffer + offset + 0) = (u_crash.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_crash.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_crash.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_crash.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->crash);
      union {
        float real;
        uint32_t base;
      } u_incline;
      u_incline.real = this->incline;
      *(outbuffer + offset + 0) = (u_incline.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_incline.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_incline.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_incline.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->incline);
      union {
        float real;
        uint32_t base;
      } u_leaning;
      u_leaning.real = this->leaning;
      *(outbuffer + offset + 0) = (u_leaning.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_leaning.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_leaning.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_leaning.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->leaning);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        bool real;
        uint8_t base;
      } u_running;
      u_running.base = 0;
      u_running.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->running = u_running.real;
      offset += sizeof(this->running);
      union {
        bool real;
        uint8_t base;
      } u_offroad;
      u_offroad.base = 0;
      u_offroad.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->offroad = u_offroad.real;
      offset += sizeof(this->offroad);
      union {
        int32_t real;
        uint32_t base;
      } u_crash;
      u_crash.base = 0;
      u_crash.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_crash.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_crash.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_crash.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->crash = u_crash.real;
      offset += sizeof(this->crash);
      union {
        float real;
        uint32_t base;
      } u_incline;
      u_incline.base = 0;
      u_incline.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_incline.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_incline.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_incline.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->incline = u_incline.real;
      offset += sizeof(this->incline);
      union {
        float real;
        uint32_t base;
      } u_leaning;
      u_leaning.base = 0;
      u_leaning.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_leaning.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_leaning.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_leaning.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->leaning = u_leaning.real;
      offset += sizeof(this->leaning);
     return offset;
    }

    const char * getType(){ return "unity_package/Unity2Simulink"; };
    const char * getMD5(){ return "8e63d3aac35859f6526118315ffe95ce"; };

  };

}
#endif