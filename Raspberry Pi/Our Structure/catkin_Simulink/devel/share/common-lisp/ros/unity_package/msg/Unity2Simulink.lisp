; Auto-generated. Do not edit!


(cl:in-package unity_package-msg)


;//! \htmlinclude Unity2Simulink.msg.html

(cl:defclass <Unity2Simulink> (roslisp-msg-protocol:ros-message)
  ((running
    :reader running
    :initarg :running
    :type cl:boolean
    :initform cl:nil)
   (offroad
    :reader offroad
    :initarg :offroad
    :type cl:boolean
    :initform cl:nil)
   (crash
    :reader crash
    :initarg :crash
    :type cl:integer
    :initform 0)
   (incline
    :reader incline
    :initarg :incline
    :type cl:float
    :initform 0.0)
   (leaning
    :reader leaning
    :initarg :leaning
    :type cl:float
    :initform 0.0))
)

(cl:defclass Unity2Simulink (<Unity2Simulink>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Unity2Simulink>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Unity2Simulink)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_package-msg:<Unity2Simulink> is deprecated: use unity_package-msg:Unity2Simulink instead.")))

(cl:ensure-generic-function 'running-val :lambda-list '(m))
(cl:defmethod running-val ((m <Unity2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:running-val is deprecated.  Use unity_package-msg:running instead.")
  (running m))

(cl:ensure-generic-function 'offroad-val :lambda-list '(m))
(cl:defmethod offroad-val ((m <Unity2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:offroad-val is deprecated.  Use unity_package-msg:offroad instead.")
  (offroad m))

(cl:ensure-generic-function 'crash-val :lambda-list '(m))
(cl:defmethod crash-val ((m <Unity2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:crash-val is deprecated.  Use unity_package-msg:crash instead.")
  (crash m))

(cl:ensure-generic-function 'incline-val :lambda-list '(m))
(cl:defmethod incline-val ((m <Unity2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:incline-val is deprecated.  Use unity_package-msg:incline instead.")
  (incline m))

(cl:ensure-generic-function 'leaning-val :lambda-list '(m))
(cl:defmethod leaning-val ((m <Unity2Simulink>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_package-msg:leaning-val is deprecated.  Use unity_package-msg:leaning instead.")
  (leaning m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Unity2Simulink>) ostream)
  "Serializes a message object of type '<Unity2Simulink>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'running) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'offroad) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'crash)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'incline))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'leaning))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Unity2Simulink>) istream)
  "Deserializes a message object of type '<Unity2Simulink>"
    (cl:setf (cl:slot-value msg 'running) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'offroad) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'crash) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'incline) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'leaning) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Unity2Simulink>)))
  "Returns string type for a message object of type '<Unity2Simulink>"
  "unity_package/Unity2Simulink")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Unity2Simulink)))
  "Returns string type for a message object of type 'Unity2Simulink"
  "unity_package/Unity2Simulink")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Unity2Simulink>)))
  "Returns md5sum for a message object of type '<Unity2Simulink>"
  "8e63d3aac35859f6526118315ffe95ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Unity2Simulink)))
  "Returns md5sum for a message object of type 'Unity2Simulink"
  "8e63d3aac35859f6526118315ffe95ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Unity2Simulink>)))
  "Returns full string definition for message of type '<Unity2Simulink>"
  (cl:format cl:nil "bool running~%bool offroad~%int32 crash~%float32 incline~%float32 leaning~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Unity2Simulink)))
  "Returns full string definition for message of type 'Unity2Simulink"
  (cl:format cl:nil "bool running~%bool offroad~%int32 crash~%float32 incline~%float32 leaning~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Unity2Simulink>))
  (cl:+ 0
     1
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Unity2Simulink>))
  "Converts a ROS message object to a list"
  (cl:list 'Unity2Simulink
    (cl:cons ':running (running msg))
    (cl:cons ':offroad (offroad msg))
    (cl:cons ':crash (crash msg))
    (cl:cons ':incline (incline msg))
    (cl:cons ':leaning (leaning msg))
))
