; Auto-generated. Do not edit!


(cl:in-package unity_package-msg)


;//! \htmlinclude Simulink2Unity.msg.html

(cl:defclass <Simulink2Unity> (roslisp-msg-protocol:ros-message)
  ((roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (rpm
    :reader rpm
    :initarg :rpm
    :type cl:float
    :initform 0.0)
   (steering_angle
    :reader steering_angle
    :initarg :steering_angle
    :type cl:float
    :initform 0.0)
   (brake_front
    :reader brake_front
    :initarg :brake_front
    :type cl:float
    :initform 0.0)
   (throttle
    :reader throttle
    :initarg :throttle
    :type cl:float
    :initform 0.0)
   (clutch_switch
    :reader clutch_switch
    :initarg :clutch_switch
    :type cl:float
    :initform 0.0)
   (gear
    :reader gear
    :initarg :gear
    :type cl:integer
    :initform 0)
   (emergencyStop
    :reader emergencyStop
    :initarg :emergencyStop
    :type cl:integer
    :initform 0)
   (rigPositionX
    :reader rigPositionX
    :initarg :rigPositionX
    :type cl:float
    :initform 0.0))
)

(cl:defclass Simulink2Unity (<Simulink2Unity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Simulink2Unity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Simulink2Unity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_package-msg:<Simulink2Unity> is deprecated: use unity_package-msg:Simulink2Unity instead.")))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:roll-val is deprecated.  Use unity_package-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:pitch-val is deprecated.  Use unity_package-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:yaw-val is deprecated.  Use unity_package-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:speed-val is deprecated.  Use unity_package-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'rpm-val :lambda-list '(m))
(cl:defmethod rpm-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:rpm-val is deprecated.  Use unity_package-msg:rpm instead.")
  (rpm m))

(cl:ensure-generic-function 'steering_angle-val :lambda-list '(m))
(cl:defmethod steering_angle-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:steering_angle-val is deprecated.  Use unity_package-msg:steering_angle instead.")
  (steering_angle m))

(cl:ensure-generic-function 'brake_front-val :lambda-list '(m))
(cl:defmethod brake_front-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:brake_front-val is deprecated.  Use unity_package-msg:brake_front instead.")
  (brake_front m))

(cl:ensure-generic-function 'throttle-val :lambda-list '(m))
(cl:defmethod throttle-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:throttle-val is deprecated.  Use unity_package-msg:throttle instead.")
  (throttle m))

(cl:ensure-generic-function 'clutch_switch-val :lambda-list '(m))
(cl:defmethod clutch_switch-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:clutch_switch-val is deprecated.  Use unity_package-msg:clutch_switch instead.")
  (clutch_switch m))

(cl:ensure-generic-function 'gear-val :lambda-list '(m))
(cl:defmethod gear-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:gear-val is deprecated.  Use unity_package-msg:gear instead.")
  (gear m))

(cl:ensure-generic-function 'emergencyStop-val :lambda-list '(m))
(cl:defmethod emergencyStop-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:emergencyStop-val is deprecated.  Use unity_package-msg:emergencyStop instead.")
  (emergencyStop m))

(cl:ensure-generic-function 'rigPositionX-val :lambda-list '(m))
(cl:defmethod rigPositionX-val ((m <Simulink2Unity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:rigPositionX-val is deprecated.  Use unity_package-msg:rigPositionX instead.")
  (rigPositionX m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Simulink2Unity>) ostream)
  "Serializes a message object of type '<Simulink2Unity>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rpm))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brake_front))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'throttle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'clutch_switch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'gear)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'emergencyStop)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rigPositionX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Simulink2Unity>) istream)
  "Deserializes a message object of type '<Simulink2Unity>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rpm) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_angle) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'throttle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'clutch_switch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gear) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'emergencyStop) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rigPositionX) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Simulink2Unity>)))
  "Returns string type for a message object of type '<Simulink2Unity>"
  "unity_package/Simulink2Unity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Simulink2Unity)))
  "Returns string type for a message object of type 'Simulink2Unity"
  "unity_package/Simulink2Unity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Simulink2Unity>)))
  "Returns md5sum for a message object of type '<Simulink2Unity>"
  "3f1a4dc149ebeba4a6042b9b16a4dd4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Simulink2Unity)))
  "Returns md5sum for a message object of type 'Simulink2Unity"
  "3f1a4dc149ebeba4a6042b9b16a4dd4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Simulink2Unity>)))
  "Returns full string definition for message of type '<Simulink2Unity>"
  (cl:format cl:nil "float32 roll~%float32 pitch~%float32 yaw~%float32 speed~%float32 rpm~%float32 steering_angle~%float32 brake_front~%float32 throttle~%float32 clutch_switch~%int32 gear~%int32 emergencyStop~%float32 rigPositionX~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Simulink2Unity)))
  "Returns full string definition for message of type 'Simulink2Unity"
  (cl:format cl:nil "float32 roll~%float32 pitch~%float32 yaw~%float32 speed~%float32 rpm~%float32 steering_angle~%float32 brake_front~%float32 throttle~%float32 clutch_switch~%int32 gear~%int32 emergencyStop~%float32 rigPositionX~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Simulink2Unity>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Simulink2Unity>))
  "Converts a ROS message object to a list"
  (cl:list 'Simulink2Unity
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':rpm (rpm msg))
    (cl:cons ':steering_angle (steering_angle msg))
    (cl:cons ':brake_front (brake_front msg))
    (cl:cons ':throttle (throttle msg))
    (cl:cons ':clutch_switch (clutch_switch msg))
    (cl:cons ':gear (gear msg))
    (cl:cons ':emergencyStop (emergencyStop msg))
    (cl:cons ':rigPositionX (rigPositionX msg))
))
