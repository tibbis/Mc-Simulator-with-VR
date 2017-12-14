; Auto-generated. Do not edit!


(cl:in-package unity_package-msg)


;//! \htmlinclude Simulink2MotionPC.msg.html

(cl:defclass <Simulink2MotionPC> (roslisp-msg-protocol:ros-message)
  ((x_ddot
    :reader x_ddot
    :initarg :x_ddot
    :type cl:float
    :initform 0.0)
   (y_ddot
    :reader y_ddot
    :initarg :y_ddot
    :type cl:float
    :initform 0.0)
   (z_ddot
    :reader z_ddot
    :initarg :z_ddot
    :type cl:float
    :initform 0.0)
   (roll_ddot
    :reader roll_ddot
    :initarg :roll_ddot
    :type cl:float
    :initform 0.0)
   (pitch_ddot
    :reader pitch_ddot
    :initarg :pitch_ddot
    :type cl:float
    :initform 0.0)
   (yaw_ddot
    :reader yaw_ddot
    :initarg :yaw_ddot
    :type cl:float
    :initform 0.0))
)

(cl:defclass Simulink2MotionPC (<Simulink2MotionPC>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Simulink2MotionPC>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Simulink2MotionPC)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_package-msg:<Simulink2MotionPC> is deprecated: use unity_package-msg:Simulink2MotionPC instead.")))

(cl:ensure-generic-function 'x_ddot-val :lambda-list '(m))
(cl:defmethod x_ddot-val ((m <Simulink2MotionPC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:x_ddot-val is deprecated.  Use unity_package-msg:x_ddot instead.")
  (x_ddot m))

(cl:ensure-generic-function 'y_ddot-val :lambda-list '(m))
(cl:defmethod y_ddot-val ((m <Simulink2MotionPC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:y_ddot-val is deprecated.  Use unity_package-msg:y_ddot instead.")
  (y_ddot m))

(cl:ensure-generic-function 'z_ddot-val :lambda-list '(m))
(cl:defmethod z_ddot-val ((m <Simulink2MotionPC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:z_ddot-val is deprecated.  Use unity_package-msg:z_ddot instead.")
  (z_ddot m))

(cl:ensure-generic-function 'roll_ddot-val :lambda-list '(m))
(cl:defmethod roll_ddot-val ((m <Simulink2MotionPC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:roll_ddot-val is deprecated.  Use unity_package-msg:roll_ddot instead.")
  (roll_ddot m))

(cl:ensure-generic-function 'pitch_ddot-val :lambda-list '(m))
(cl:defmethod pitch_ddot-val ((m <Simulink2MotionPC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:pitch_ddot-val is deprecated.  Use unity_package-msg:pitch_ddot instead.")
  (pitch_ddot m))

(cl:ensure-generic-function 'yaw_ddot-val :lambda-list '(m))
(cl:defmethod yaw_ddot-val ((m <Simulink2MotionPC>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:yaw_ddot-val is deprecated.  Use unity_package-msg:yaw_ddot instead.")
  (yaw_ddot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Simulink2MotionPC>) ostream)
  "Serializes a message object of type '<Simulink2MotionPC>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x_ddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y_ddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z_ddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'roll_ddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch_ddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw_ddot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Simulink2MotionPC>) istream)
  "Deserializes a message object of type '<Simulink2MotionPC>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_ddot) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_ddot) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z_ddot) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_ddot) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_ddot) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_ddot) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Simulink2MotionPC>)))
  "Returns string type for a message object of type '<Simulink2MotionPC>"
  "unity_package/Simulink2MotionPC")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Simulink2MotionPC)))
  "Returns string type for a message object of type 'Simulink2MotionPC"
  "unity_package/Simulink2MotionPC")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Simulink2MotionPC>)))
  "Returns md5sum for a message object of type '<Simulink2MotionPC>"
  "f42ae6ddad2a7bc05f1d468d2ad4cc0f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Simulink2MotionPC)))
  "Returns md5sum for a message object of type 'Simulink2MotionPC"
  "f42ae6ddad2a7bc05f1d468d2ad4cc0f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Simulink2MotionPC>)))
  "Returns full string definition for message of type '<Simulink2MotionPC>"
  (cl:format cl:nil "float64 x_ddot ~%float64 y_ddot~%float64 z_ddot~%float64 roll_ddot~%float64 pitch_ddot~%float64 yaw_ddot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Simulink2MotionPC)))
  "Returns full string definition for message of type 'Simulink2MotionPC"
  (cl:format cl:nil "float64 x_ddot ~%float64 y_ddot~%float64 z_ddot~%float64 roll_ddot~%float64 pitch_ddot~%float64 yaw_ddot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Simulink2MotionPC>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Simulink2MotionPC>))
  "Converts a ROS message object to a list"
  (cl:list 'Simulink2MotionPC
    (cl:cons ':x_ddot (x_ddot msg))
    (cl:cons ':y_ddot (y_ddot msg))
    (cl:cons ':z_ddot (z_ddot msg))
    (cl:cons ':roll_ddot (roll_ddot msg))
    (cl:cons ':pitch_ddot (pitch_ddot msg))
    (cl:cons ':yaw_ddot (yaw_ddot msg))
))
