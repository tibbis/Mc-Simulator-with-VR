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

class Arduino2Simulink {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.steering_sensor = null;
      this.acc_sensor = null;
      this.brake_front = null;
      this.brake_back = null;
      this.emergency_freeze = null;
      this.to_neutral = null;
    }
    else {
      if (initObj.hasOwnProperty('steering_sensor')) {
        this.steering_sensor = initObj.steering_sensor
      }
      else {
        this.steering_sensor = 0.0;
      }
      if (initObj.hasOwnProperty('acc_sensor')) {
        this.acc_sensor = initObj.acc_sensor
      }
      else {
        this.acc_sensor = 0.0;
      }
      if (initObj.hasOwnProperty('brake_front')) {
        this.brake_front = initObj.brake_front
      }
      else {
        this.brake_front = 0.0;
      }
      if (initObj.hasOwnProperty('brake_back')) {
        this.brake_back = initObj.brake_back
      }
      else {
        this.brake_back = 0.0;
      }
      if (initObj.hasOwnProperty('emergency_freeze')) {
        this.emergency_freeze = initObj.emergency_freeze
      }
      else {
        this.emergency_freeze = 0;
      }
      if (initObj.hasOwnProperty('to_neutral')) {
        this.to_neutral = initObj.to_neutral
      }
      else {
        this.to_neutral = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Arduino2Simulink
    // Serialize message field [steering_sensor]
    bufferOffset = _serializer.float32(obj.steering_sensor, buffer, bufferOffset);
    // Serialize message field [acc_sensor]
    bufferOffset = _serializer.float32(obj.acc_sensor, buffer, bufferOffset);
    // Serialize message field [brake_front]
    bufferOffset = _serializer.float32(obj.brake_front, buffer, bufferOffset);
    // Serialize message field [brake_back]
    bufferOffset = _serializer.float32(obj.brake_back, buffer, bufferOffset);
    // Serialize message field [emergency_freeze]
    bufferOffset = _serializer.int32(obj.emergency_freeze, buffer, bufferOffset);
    // Serialize message field [to_neutral]
    bufferOffset = _serializer.int32(obj.to_neutral, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Arduino2Simulink
    let len;
    let data = new Arduino2Simulink(null);
    // Deserialize message field [steering_sensor]
    data.steering_sensor = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acc_sensor]
    data.acc_sensor = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brake_front]
    data.brake_front = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [brake_back]
    data.brake_back = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [emergency_freeze]
    data.emergency_freeze = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [to_neutral]
    data.to_neutral = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_package/Arduino2Simulink';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e173c33e0758ea7211b5bab2745be52';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 steering_sensor
    float32 acc_sensor
    float32 brake_front
    float32 brake_back
    int32 emergency_freeze
    int32 to_neutral
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Arduino2Simulink(null);
    if (msg.steering_sensor !== undefined) {
      resolved.steering_sensor = msg.steering_sensor;
    }
    else {
      resolved.steering_sensor = 0.0
    }

    if (msg.acc_sensor !== undefined) {
      resolved.acc_sensor = msg.acc_sensor;
    }
    else {
      resolved.acc_sensor = 0.0
    }

    if (msg.brake_front !== undefined) {
      resolved.brake_front = msg.brake_front;
    }
    else {
      resolved.brake_front = 0.0
    }

    if (msg.brake_back !== undefined) {
      resolved.brake_back = msg.brake_back;
    }
    else {
      resolved.brake_back = 0.0
    }

    if (msg.emergency_freeze !== undefined) {
      resolved.emergency_freeze = msg.emergency_freeze;
    }
    else {
      resolved.emergency_freeze = 0
    }

    if (msg.to_neutral !== undefined) {
      resolved.to_neutral = msg.to_neutral;
    }
    else {
      resolved.to_neutral = 0
    }

    return resolved;
    }
};

module.exports = Arduino2Simulink;
