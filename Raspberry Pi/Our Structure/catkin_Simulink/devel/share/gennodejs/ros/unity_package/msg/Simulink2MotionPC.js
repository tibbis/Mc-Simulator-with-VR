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

class Simulink2MotionPC {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_ddot = null;
      this.y_ddot = null;
      this.z_ddot = null;
      this.roll_ddot = null;
      this.pitch_ddot = null;
      this.yaw_ddot = null;
    }
    else {
      if (initObj.hasOwnProperty('x_ddot')) {
        this.x_ddot = initObj.x_ddot
      }
      else {
        this.x_ddot = 0.0;
      }
      if (initObj.hasOwnProperty('y_ddot')) {
        this.y_ddot = initObj.y_ddot
      }
      else {
        this.y_ddot = 0.0;
      }
      if (initObj.hasOwnProperty('z_ddot')) {
        this.z_ddot = initObj.z_ddot
      }
      else {
        this.z_ddot = 0.0;
      }
      if (initObj.hasOwnProperty('roll_ddot')) {
        this.roll_ddot = initObj.roll_ddot
      }
      else {
        this.roll_ddot = 0.0;
      }
      if (initObj.hasOwnProperty('pitch_ddot')) {
        this.pitch_ddot = initObj.pitch_ddot
      }
      else {
        this.pitch_ddot = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_ddot')) {
        this.yaw_ddot = initObj.yaw_ddot
      }
      else {
        this.yaw_ddot = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Simulink2MotionPC
    // Serialize message field [x_ddot]
    bufferOffset = _serializer.float64(obj.x_ddot, buffer, bufferOffset);
    // Serialize message field [y_ddot]
    bufferOffset = _serializer.float64(obj.y_ddot, buffer, bufferOffset);
    // Serialize message field [z_ddot]
    bufferOffset = _serializer.float64(obj.z_ddot, buffer, bufferOffset);
    // Serialize message field [roll_ddot]
    bufferOffset = _serializer.float64(obj.roll_ddot, buffer, bufferOffset);
    // Serialize message field [pitch_ddot]
    bufferOffset = _serializer.float64(obj.pitch_ddot, buffer, bufferOffset);
    // Serialize message field [yaw_ddot]
    bufferOffset = _serializer.float64(obj.yaw_ddot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Simulink2MotionPC
    let len;
    let data = new Simulink2MotionPC(null);
    // Deserialize message field [x_ddot]
    data.x_ddot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_ddot]
    data.y_ddot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z_ddot]
    data.z_ddot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [roll_ddot]
    data.roll_ddot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitch_ddot]
    data.pitch_ddot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw_ddot]
    data.yaw_ddot = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_package/Simulink2MotionPC';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f42ae6ddad2a7bc05f1d468d2ad4cc0f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x_ddot 
    float64 y_ddot
    float64 z_ddot
    float64 roll_ddot
    float64 pitch_ddot
    float64 yaw_ddot
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Simulink2MotionPC(null);
    if (msg.x_ddot !== undefined) {
      resolved.x_ddot = msg.x_ddot;
    }
    else {
      resolved.x_ddot = 0.0
    }

    if (msg.y_ddot !== undefined) {
      resolved.y_ddot = msg.y_ddot;
    }
    else {
      resolved.y_ddot = 0.0
    }

    if (msg.z_ddot !== undefined) {
      resolved.z_ddot = msg.z_ddot;
    }
    else {
      resolved.z_ddot = 0.0
    }

    if (msg.roll_ddot !== undefined) {
      resolved.roll_ddot = msg.roll_ddot;
    }
    else {
      resolved.roll_ddot = 0.0
    }

    if (msg.pitch_ddot !== undefined) {
      resolved.pitch_ddot = msg.pitch_ddot;
    }
    else {
      resolved.pitch_ddot = 0.0
    }

    if (msg.yaw_ddot !== undefined) {
      resolved.yaw_ddot = msg.yaw_ddot;
    }
    else {
      resolved.yaw_ddot = 0.0
    }

    return resolved;
    }
};

module.exports = Simulink2MotionPC;
