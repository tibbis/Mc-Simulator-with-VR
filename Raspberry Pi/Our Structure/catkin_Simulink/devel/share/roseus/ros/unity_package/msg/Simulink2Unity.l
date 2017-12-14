;; Auto-generated. Do not edit!


(when (boundp 'unity_package::Simulink2Unity)
  (if (not (find-package "UNITY_PACKAGE"))
    (make-package "UNITY_PACKAGE"))
  (shadow 'Simulink2Unity (find-package "UNITY_PACKAGE")))
(unless (find-package "UNITY_PACKAGE::SIMULINK2UNITY")
  (make-package "UNITY_PACKAGE::SIMULINK2UNITY"))

(in-package "ROS")
;;//! \htmlinclude Simulink2Unity.msg.html


(defclass unity_package::Simulink2Unity
  :super ros::object
  :slots (_roll _pitch _yaw _speed _rpm _steering_angle _brake_front _throttle _clutch_switch _gear _emergencyStop _rigPositionX ))

(defmethod unity_package::Simulink2Unity
  (:init
   (&key
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:speed __speed) 0.0)
    ((:rpm __rpm) 0.0)
    ((:steering_angle __steering_angle) 0.0)
    ((:brake_front __brake_front) 0.0)
    ((:throttle __throttle) 0.0)
    ((:clutch_switch __clutch_switch) 0.0)
    ((:gear __gear) 0)
    ((:emergencyStop __emergencyStop) 0)
    ((:rigPositionX __rigPositionX) 0.0)
    )
   (send-super :init)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _speed (float __speed))
   (setq _rpm (float __rpm))
   (setq _steering_angle (float __steering_angle))
   (setq _brake_front (float __brake_front))
   (setq _throttle (float __throttle))
   (setq _clutch_switch (float __clutch_switch))
   (setq _gear (round __gear))
   (setq _emergencyStop (round __emergencyStop))
   (setq _rigPositionX (float __rigPositionX))
   self)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:rpm
   (&optional __rpm)
   (if __rpm (setq _rpm __rpm)) _rpm)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:brake_front
   (&optional __brake_front)
   (if __brake_front (setq _brake_front __brake_front)) _brake_front)
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:clutch_switch
   (&optional __clutch_switch)
   (if __clutch_switch (setq _clutch_switch __clutch_switch)) _clutch_switch)
  (:gear
   (&optional __gear)
   (if __gear (setq _gear __gear)) _gear)
  (:emergencyStop
   (&optional __emergencyStop)
   (if __emergencyStop (setq _emergencyStop __emergencyStop)) _emergencyStop)
  (:rigPositionX
   (&optional __rigPositionX)
   (if __rigPositionX (setq _rigPositionX __rigPositionX)) _rigPositionX)
  (:serialization-length
   ()
   (+
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _speed
    4
    ;; float32 _rpm
    4
    ;; float32 _steering_angle
    4
    ;; float32 _brake_front
    4
    ;; float32 _throttle
    4
    ;; float32 _clutch_switch
    4
    ;; int32 _gear
    4
    ;; int32 _emergencyStop
    4
    ;; float32 _rigPositionX
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rpm
       (sys::poke _rpm (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering_angle
       (sys::poke _steering_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake_front
       (sys::poke _brake_front (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _throttle
       (sys::poke _throttle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _clutch_switch
       (sys::poke _clutch_switch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _gear
       (write-long _gear s)
     ;; int32 _emergencyStop
       (write-long _emergencyStop s)
     ;; float32 _rigPositionX
       (sys::poke _rigPositionX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rpm
     (setq _rpm (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake_front
     (setq _brake_front (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _throttle
     (setq _throttle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _clutch_switch
     (setq _clutch_switch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _gear
     (setq _gear (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _emergencyStop
     (setq _emergencyStop (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _rigPositionX
     (setq _rigPositionX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_package::Simulink2Unity :md5sum-) "3f1a4dc149ebeba4a6042b9b16a4dd4f")
(setf (get unity_package::Simulink2Unity :datatype-) "unity_package/Simulink2Unity")
(setf (get unity_package::Simulink2Unity :definition-)
      "float32 roll
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

")



(provide :unity_package/Simulink2Unity "3f1a4dc149ebeba4a6042b9b16a4dd4f")


