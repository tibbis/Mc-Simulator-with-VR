; Auto-generated. Do not edit!


(cl:in-package unity_package-msg)


;//! \htmlinclude Simulink2Arduino.msg.html

(cl:defclass <Simulink2Arduino> (roslisp-msg-protocol:ros-message)
  ((torque_reference
    :reader torque_reference
    :initarg :torque_reference
    :type cl:float
    :initform 0.0))
)

(cl:defclass Simulink2Arduino (<Simulink2Arduino>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Simulink2Arduino>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Simulink2Arduino)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_package-msg:<Simulink2Arduino> is deprecated: use unity_package-msg:Simulink2Arduino instead.")))

(cl:ensure-generic-function 'torque_reference-val :lambda-list '(m))
(cl:defmethod torque_reference-val ((m <Simulink2Arduino>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:torque_reference-val is deprecated.  Use unity_package-msg:torque_reference instead.")
  (torque_reference m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Simulink2Arduino>) ostream)
  "Serializes a message object of type '<Simulink2Arduino>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'torque_reference))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Simulink2Arduino>) istream)
  "Deserializes a message object of type '<Simulink2Arduino>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque_reference) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Simulink2Arduino>)))
  "Returns string type for a message object of type '<Simulink2Arduino>"
  "unity_package/Simulink2Arduino")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Simulink2Arduino)))
  "Returns string type for a message object of type 'Simulink2Arduino"
  "unity_package/Simulink2Arduino")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Simulink2Arduino>)))
  "Returns md5sum for a message object of type '<Simulink2Arduino>"
  "b553eb5fddc8e8c8cb9caa506e3fefe4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Simulink2Arduino)))
  "Returns md5sum for a message object of type 'Simulink2Arduino"
  "b553eb5fddc8e8c8cb9caa506e3fefe4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Simulink2Arduino>)))
  "Returns full string definition for message of type '<Simulink2Arduino>"
  (cl:format cl:nil "float64 torque_reference~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Simulink2Arduino)))
  "Returns full string definition for message of type 'Simulink2Arduino"
  (cl:format cl:nil "float64 torque_reference~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Simulink2Arduino>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Simulink2Arduino>))
  "Converts a ROS message object to a list"
  (cl:list 'Simulink2Arduino
    (cl:cons ':torque_reference (torque_reference msg))
))
