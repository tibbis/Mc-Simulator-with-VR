;; Auto-generated. Do not edit!


(when (boundp 'unity_package::Arduino2Simulink)
  (if (not (find-package "UNITY_PACKAGE"))
    (make-package "UNITY_PACKAGE"))
  (shadow 'Arduino2Simulink (find-package "UNITY_PACKAGE")))
(unless (find-package "UNITY_PACKAGE::ARDUINO2SIMULINK")
  (make-package "UNITY_PACKAGE::ARDUINO2SIMULINK"))

(in-package "ROS")
;;//! \htmlinclude Arduino2Simulink.msg.html


(defclass unity_package::Arduino2Simulink
  :super ros::object
  :slots (_steering_sensor _acc_sensor _brake_front _brake_back _emergency_freeze _to_neutral ))

(defmethod unity_package::Arduino2Simulink
  (:init
   (&key
    ((:steering_sensor __steering_sensor) 0.0)
    ((:acc_sensor __acc_sensor) 0.0)
    ((:brake_front __brake_front) 0.0)
    ((:brake_back __brake_back) 0.0)
    ((:emergency_freeze __emergency_freeze) 0)
    ((:to_neutral __to_neutral) 0)
    )
   (send-super :init)
   (setq _steering_sensor (float __steering_sensor))
   (setq _acc_sensor (float __acc_sensor))
   (setq _brake_front (float __brake_front))
   (setq _brake_back (float __brake_back))
   (setq _emergency_freeze (round __emergency_freeze))
   (setq _to_neutral (round __to_neutral))
   self)
  (:steering_sensor
   (&optional __steering_sensor)
   (if __steering_sensor (setq _steering_sensor __steering_sensor)) _steering_sensor)
  (:acc_sensor
   (&optional __acc_sensor)
   (if __acc_sensor (setq _acc_sensor __acc_sensor)) _acc_sensor)
  (:brake_front
   (&optional __brake_front)
   (if __brake_front (setq _brake_front __brake_front)) _brake_front)
  (:brake_back
   (&optional __brake_back)
   (if __brake_back (setq _brake_back __brake_back)) _brake_back)
  (:emergency_freeze
   (&optional __emergency_freeze)
   (if __emergency_freeze (setq _emergency_freeze __emergency_freeze)) _emergency_freeze)
  (:to_neutral
   (&optional __to_neutral)
   (if __to_neutral (setq _to_neutral __to_neutral)) _to_neutral)
  (:serialization-length
   ()
   (+
    ;; float32 _steering_sensor
    4
    ;; float32 _acc_sensor
    4
    ;; float32 _brake_front
    4
    ;; float32 _brake_back
    4
    ;; int32 _emergency_freeze
    4
    ;; int32 _to_neutral
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _steering_sensor
       (sys::poke _steering_sensor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_sensor
       (sys::poke _acc_sensor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake_front
       (sys::poke _brake_front (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake_back
       (sys::poke _brake_back (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _emergency_freeze
       (write-long _emergency_freeze s)
     ;; int32 _to_neutral
       (write-long _to_neutral s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _steering_sensor
     (setq _steering_sensor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_sensor
     (setq _acc_sensor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake_front
     (setq _brake_front (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake_back
     (setq _brake_back (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _emergency_freeze
     (setq _emergency_freeze (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _to_neutral
     (setq _to_neutral (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_package::Arduino2Simulink :md5sum-) "4e173c33e0758ea7211b5bab2745be52")
(setf (get unity_package::Arduino2Simulink :datatype-) "unity_package/Arduino2Simulink")
(setf (get unity_package::Arduino2Simulink :definition-)
      "float32 steering_sensor
float32 acc_sensor
float32 brake_front
float32 brake_back
int32 emergency_freeze
int32 to_neutral

")



(provide :unity_package/Arduino2Simulink "4e173c33e0758ea7211b5bab2745be52")


