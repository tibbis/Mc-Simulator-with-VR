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

class Simulink2Arduino {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.torque_reference = null;
    }
    else {
      if (initObj.hasOwnProperty('torque_reference')) {
        this.torque_reference = initObj.torque_reference
      }
      else {
        this.torque_reference = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Simulink2Arduino
    // Serialize message field [torque_reference]
    bufferOffset = _serializer.float64(obj.torque_reference, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Simulink2Arduino
    let len;
    let data = new Simulink2Arduino(null);
    // Deserialize message field [torque_reference]
    data.torque_reference = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'unity_package/Simulink2Arduino';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b553eb5fddc8e8c8cb9caa506e3fefe4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 torque_reference
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Simulink2Arduino(null);
    if (msg.torque_reference !== undefined) {
      resolved.torque_reference = msg.torque_reference;
    }
    else {
      resolved.torque_reference = 0.0
    }

    return resolved;
    }
};

module.exports = Simulink2Arduino;
