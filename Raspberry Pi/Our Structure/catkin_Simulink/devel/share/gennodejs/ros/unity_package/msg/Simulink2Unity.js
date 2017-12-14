// Auto-generated. Do not edit!

// (in-package unity_package.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Simulink2Unity {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.speed = null;
      this.rpm = null;
      this.steering_angle = null;
      this.brake_front = null;
      this.throttle = null;
      this.clutch_switch = null;
      this.gear = null;
      this.emergencyStop = null;
      this.rigPositionX = null;
    }
    else {
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('rpm')) {
        this.rpm = initObj.rpm
      }
      else {
        this.rpm = 0.0;
      }
      if (initObj.hasOwnProperty('steering_angle')) {
        this.steering_angle = initObj.steering_angle
      }
      else {
        this.steering_angle = 0.0;
      }
      if (initObj.hasOwnProperty('brake_front')) {
        this.brake_front = initObj.brake_front
      }
      else {
        this.brake_front = 0.0;
      }
      if (initObj.hasOwnProperty('throttle')) {
        this.throttle = initObj.throttle
      }
      else {
        this.throttle = 0.0;
      }
      if (initObj.hasOwnProperty('clutch_switch')) {
        this.clutch_switch = initObj.clutch_switch
      }
      else {
        this.clutch_switch = 0.0;
      }
      if (initObj.hasOwnProperty('gear')) {
        this.gear = initObj.gear
      }
      else {
        this.gear = 0;
      }
      if (initObj.hasOwnProperty('emergencyStop')) {
        this.emergencyStop = initObj.emergencyStop
      }
      else {
        this.emergencyStop = 0;
      }
      if (initObj.hasOwnProperty('rigPositionX')) {
        this.rigPositionX = initObj.rigPositionX
      }
      else {
        this.rigPositionX = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Simulink2Unity
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    // Serialize message field [rpm]
    bufferOffset = _serializer.float32(obj.rpm, buffer, bufferOffset);
    // Serialize message field [steering_angle]
    bufferOffset = _serializer.float32(obj.steering_angle, buffer, bufferOffset);
    // Serialize message field [brake_front]
    bufferOffset = _serializer.float32(obj.brake_front, buffer, bufferOffset);
    // Serialize message field [throttle]
    bufferOffset = _serializer.float32(obj.throttle, buffer, bufferOffset);
    // Serialize message field [clutch_switch]
    bufferOffset = _serializer.float32(obj.clutch_switch, buffer, bufferOffset);
    // Serialize message field [gear]
    bufferOffset = _serializer.int32(obj.gear, buffer, bufferOffset);
    // Serialize message field [emergencyStop]
    bufferOffset = _serializer.int32(obj.emergencyStop, buffer, bufferOffset);
    // Serialize message field [rigPositionX]
    bufferOffset = _serializer.float32(obj.rigPositionX, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Simulink2Unity
    let len;
    let data = new Simulink2Unity(null);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rpm]
    data.rpm = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [steering_angle]
    data.steering_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brake_front]
    data.brake_front = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [throttle]
    data.throttle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [clutch_switch]
    data.clutch_switch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gear]
    data.gear = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [emergencyStop]
    data.emergencyStop = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rigPositionX]
    data.rigPositionX = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_package/Simulink2Unity';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f1a4dc149ebeba4a6042b9b16a4dd4f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 roll
    float32 pitch
    float32 yaw
    float32 speed
    float32 rpm
    float32 steering_angle
    float32 brake_front
    float32 throttle
    float32 clutch_switch
    int32 gear
    int32 emergencyStop
    float32 rigPositionX
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Simulink2Unity(null);
    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.rpm !== undefined) {
      resolved.rpm = msg.rpm;
    }
    else {
      resolved.rpm = 0.0
    }

    if (msg.steering_angle !== undefined) {
      resolved.steering_angle = msg.steering_angle;
    }
    else {
      resolved.steering_angle = 0.0
    }

    if (msg.brake_front !== undefined) {
      resolved.brake_front = msg.brake_front;
    }
    else {
      resolved.brake_front = 0.0
    }

    if (msg.throttle !== undefined) {
      resolved.throttle = msg.throttle;
    }
    else {
      resolved.throttle = 0.0
    }

    if (msg.clutch_switch !== undefined) {
      resolved.clutch_switch = msg.clutch_switch;
    }
    else {
      resolved.clutch_switch = 0.0
    }

    if (msg.gear !== undefined) {
      resolved.gear = msg.gear;
    }
    else {
      resolved.gear = 0
    }

    if (msg.emergencyStop !== undefined) {
      resolved.emergencyStop = msg.emergencyStop;
    }
    else {
      resolved.emergencyStop = 0
    }

    if (msg.rigPositionX !== undefined) {
      resolved.rigPositionX = msg.rigPositionX;
    }
    else {
      resolved.rigPositionX = 0.0
    }

    return resolved;
    }
};

module.exports = Simulink2Unity;
