; Auto-generated. Do not edit!


(cl:in-package unity_package-msg)


;//! \htmlinclude Arduino2Simulink.msg.html

(cl:defclass <Arduino2Simulink> (roslisp-msg-protocol:ros-message)
  ((steering_sensor
    :reader steering_sensor
    :initarg :steering_sensor
    :type cl:float
    :initform 0.0)
   (acc_sensor
    :reader acc_sensor
    :initarg :acc_sensor
    :type cl:float
    :initform 0.0)
   (brake_front
    :reader brake_front
    :initarg :brake_front
    :type cl:float
    :initform 0.0)
   (brake_back
    :reader brake_back
    :initarg :brake_back
    :type cl:float
    :initform 0.0)
   (emergency_freeze
    :reader emergency_freeze
    :initarg :emergency_freeze
    :type cl:integer
    :initform 0)
   (to_neutral
    :reader to_neutral
    :initarg :to_neutral
    :type cl:integer
    :initform 0))
)

(cl:defclass Arduino2Simulink (<Arduino2Simulink>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Arduino2Simulink>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Arduino2Simulink)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_package-msg:<Arduino2Simulink> is deprecated: use unity_package-msg:Arduino2Simulink instead.")))

(cl:ensure-generic-function 'steering_sensor-val :lambda-list '(m))
(cl:defmethod steering_sensor-val ((m <Arduino2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:steering_sensor-val is deprecated.  Use unity_package-msg:steering_sensor instead.")
  (steering_sensor m))

(cl:ensure-generic-function 'acc_sensor-val :lambda-list '(m))
(cl:defmethod acc_sensor-val ((m <Arduino2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:acc_sensor-val is deprecated.  Use unity_package-msg:acc_sensor instead.")
  (acc_sensor m))

(cl:ensure-generic-function 'brake_front-val :lambda-list '(m))
(cl:defmethod brake_front-val ((m <Arduino2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:brake_front-val is deprecated.  Use unity_package-msg:brake_front instead.")
  (brake_front m))

(cl:ensure-generic-function 'brake_back-val :lambda-list '(m))
(cl:defmethod brake_back-val ((m <Arduino2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:brake_back-val is deprecated.  Use unity_package-msg:brake_back instead.")
  (brake_back m))

(cl:ensure-generic-function 'emergency_freeze-val :lambda-list '(m))
(cl:defmethod emergency_freeze-val ((m <Arduino2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:emergency_freeze-val is deprecated.  Use unity_package-msg:emergency_freeze instead.")
  (emergency_freeze m))

(cl:ensure-generic-function 'to_neutral-val :lambda-list '(m))
(cl:defmethod to_neutral-val ((m <Arduino2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:to_neutral-val is deprecated.  Use unity_package-msg:to_neutral instead.")
  (to_neutral m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Arduino2Simulink>) ostream)
  "Serializes a message object of type '<Arduino2Simulink>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering_sensor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_sensor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brake_front))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brake_back))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'emergency_freeze)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'to_neutral)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Arduino2Simulink>) istream)
  "Deserializes a message object of type '<Arduino2Simulink>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_sensor) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_sensor) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake_front) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake_back) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'emergency_freeze) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'to_neutral) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Arduino2Simulink>)))
  "Returns string type for a message object of type '<Arduino2Simulink>"
  "unity_package/Arduino2Simulink")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Arduino2Simulink)))
  "Returns string type for a message object of type 'Arduino2Simulink"
  "unity_package/Arduino2Simulink")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Arduino2Simulink>)))
  "Returns md5sum for a message object of type '<Arduino2Simulink>"
  "4e173c33e0758ea7211b5bab2745be52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Arduino2Simulink)))
  "Returns md5sum for a message object of type 'Arduino2Simulink"
  "4e173c33e0758ea7211b5bab2745be52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Arduino2Simulink>)))
  "Returns full string definition for message of type '<Arduino2Simulink>"
  (cl:format cl:nil "float32 steering_sensor~%float32 acc_sensor~%float32 brake_front~%float32 brake_back~%int32 emergency_freeze~%int32 to_neutral~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Arduino2Simulink)))
  "Returns full string definition for message of type 'Arduino2Simulink"
  (cl:format cl:nil "float32 steering_sensor~%float32 acc_sensor~%float32 brake_front~%float32 brake_back~%int32 emergency_freeze~%int32 to_neutral~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Arduino2Simulink>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Arduino2Simulink>))
  "Converts a ROS message object to a list"
  (cl:list 'Arduino2Simulink
    (cl:cons ':steering_sensor (steering_sensor msg))
    (cl:cons ':acc_sensor (acc_sensor msg))
    (cl:cons ':brake_front (brake_front msg))
    (cl:cons ':brake_back (brake_back msg))
    (cl:cons ':emergency_freeze (emergency_freeze msg))
    (cl:cons ':to_neutral (to_neutral msg))
))
