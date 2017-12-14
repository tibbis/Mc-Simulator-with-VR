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

class Unity2Simulink {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.running = null;
      this.offroad = null;
      this.crash = null;
      this.incline = null;
      this.leaning = null;
    }
    else {
      if (initObj.hasOwnProperty('running')) {
        this.running = initObj.running
      }
      else {
        this.running = false;
      }
      if (initObj.hasOwnProperty('offroad')) {
        this.offroad = initObj.offroad
      }
      else {
        this.offroad = false;
      }
      if (initObj.hasOwnProperty('crash')) {
        this.crash = initObj.crash
      }
      else {
        this.crash = 0;
      }
      if (initObj.hasOwnProperty('incline')) {
        this.incline = initObj.incline
      }
      else {
        this.incline = 0.0;
      }
      if (initObj.hasOwnProperty('leaning')) {
        this.leaning = initObj.leaning
      }
      else {
        this.leaning = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Unity2Simulink
    // Serialize message field [running]
    bufferOffset = _serializer.bool(obj.running, buffer, bufferOffset);
    // Serialize message field [offroad]
    bufferOffset = _serializer.bool(obj.offroad, buffer, bufferOffset);
    // Serialize message field [crash]
    bufferOffset = _serializer.int32(obj.crash, buffer, bufferOffset);
    // Serialize message field [incline]
    bufferOffset = _serializer.float32(obj.incline, buffer, bufferOffset);
    // Serialize message field [leaning]
    bufferOffset = _serializer.float32(obj.leaning, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Unity2Simulink
    let len;
    let data = new Unity2Simulink(null);
    // Deserialize message field [running]
    data.running = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [offroad]
    data.offroad = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [crash]
    data.crash = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [incline]
    data.incline = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [leaning]
    data.leaning = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_package/Unity2Simulink';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e63d3aac35859f6526118315ffe95ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool running
    bool offroad
    int32 crash
    float32 incline
    float32 leaning
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Unity2Simulink(null);
    if (msg.running !== undefined) {
      resolved.running = msg.running;
    }
    else {
      resolved.running = false
    }

    if (msg.offroad !== undefined) {
      resolved.offroad = msg.offroad;
    }
    else {
      resolved.offroad = false
    }

    if (msg.crash !== undefined) {
      resolved.crash = msg.crash;
    }
    else {
      resolved.crash = 0
    }

    if (msg.incline !== undefined) {
      resolved.incline = msg.incline;
    }
    else {
      resolved.incline = 0.0
    }

    if (msg.leaning !== undefined) {
      resolved.leaning = msg.leaning;
    }
    else {
      resolved.leaning = 0.0
    }

    return resolved;
    }
};

module.exports = Unity2Simulink;
