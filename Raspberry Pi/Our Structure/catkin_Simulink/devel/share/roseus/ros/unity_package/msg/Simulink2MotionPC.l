;; Auto-generated. Do not edit!


(when (boundp 'unity_package::Simulink2MotionPC)
  (if (not (find-package "UNITY_PACKAGE"))
    (make-package "UNITY_PACKAGE"))
  (shadow 'Simulink2MotionPC (find-package "UNITY_PACKAGE")))
(unless (find-package "UNITY_PACKAGE::SIMULINK2MOTIONPC")
  (make-package "UNITY_PACKAGE::SIMULINK2MOTIONPC"))

(in-package "ROS")
;;//! \htmlinclude Simulink2MotionPC.msg.html


(defclass unity_package::Simulink2MotionPC
  :super ros::object
  :slots (_x_ddot _y_ddot _z_ddot _roll_ddot _pitch_ddot _yaw_ddot ))

(defmethod unity_package::Simulink2MotionPC
  (:init
   (&key
    ((:x_ddot __x_ddot) 0.0)
    ((:y_ddot __y_ddot) 0.0)
    ((:z_ddot __z_ddot) 0.0)
    ((:roll_ddot __roll_ddot) 0.0)
    ((:pitch_ddot __pitch_ddot) 0.0)
    ((:yaw_ddot __yaw_ddot) 0.0)
    )
   (send-super :init)
   (setq _x_ddot (float __x_ddot))
   (setq _y_ddot (float __y_ddot))
   (setq _z_ddot (float __z_ddot))
   (setq _roll_ddot (float __roll_ddot))
   (setq _pitch_ddot (float __pitch_ddot))
   (setq _yaw_ddot (float __yaw_ddot))
   self)
  (:x_ddot
   (&optional __x_ddot)
   (if __x_ddot (setq _x_ddot __x_ddot)) _x_ddot)
  (:y_ddot
   (&optional __y_ddot)
   (if __y_ddot (setq _y_ddot __y_ddot)) _y_ddot)
  (:z_ddot
   (&optional __z_ddot)
   (if __z_ddot (setq _z_ddot __z_ddot)) _z_ddot)
  (:roll_ddot
   (&optional __roll_ddot)
   (if __roll_ddot (setq _roll_ddot __roll_ddot)) _roll_ddot)
  (:pitch_ddot
   (&optional __pitch_ddot)
   (if __pitch_ddot (setq _pitch_ddot __pitch_ddot)) _pitch_ddot)
  (:yaw_ddot
   (&optional __yaw_ddot)
   (if __yaw_ddot (setq _yaw_ddot __yaw_ddot)) _yaw_ddot)
  (:serialization-length
   ()
   (+
    ;; float64 _x_ddot
    8
    ;; float64 _y_ddot
    8
    ;; float64 _z_ddot
    8
    ;; float64 _roll_ddot
    8
    ;; float64 _pitch_ddot
    8
    ;; float64 _yaw_ddot
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x_ddot
       (sys::poke _x_ddot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_ddot
       (sys::poke _y_ddot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z_ddot
       (sys::poke _z_ddot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll_ddot
       (sys::poke _roll_ddot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch_ddot
       (sys::poke _pitch_ddot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw_ddot
       (sys::poke _yaw_ddot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x_ddot
     (setq _x_ddot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_ddot
     (setq _y_ddot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z_ddot
     (setq _z_ddot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll_ddot
     (setq _roll_ddot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch_ddot
     (setq _pitch_ddot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw_ddot
     (setq _yaw_ddot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get unity_package::Simulink2MotionPC :md5sum-) "f42ae6ddad2a7bc05f1d468d2ad4cc0f")
(setf (get unity_package::Simulink2MotionPC :datatype-) "unity_package/Simulink2MotionPC")
(setf (get unity_package::Simulink2MotionPC :definition-)
      "float64 x_ddot 
float64 y_ddot
float64 z_ddot
float64 roll_ddot
float64 pitch_ddot
float64 yaw_ddot


")



(provide :unity_package/Simulink2MotionPC "f42ae6ddad2a7bc05f1d468d2ad4cc0f")


