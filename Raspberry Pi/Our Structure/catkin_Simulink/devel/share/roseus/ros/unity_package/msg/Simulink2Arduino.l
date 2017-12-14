;; Auto-generated. Do not edit!


(when (boundp 'unity_package::Simulink2Arduino)
  (if (not (find-package "UNITY_PACKAGE"))
    (make-package "UNITY_PACKAGE"))
  (shadow 'Simulink2Arduino (find-package "UNITY_PACKAGE")))
(unless (find-package "UNITY_PACKAGE::SIMULINK2ARDUINO")
  (make-package "UNITY_PACKAGE::SIMULINK2ARDUINO"))

(in-package "ROS")
;;//! \htmlinclude Simulink2Arduino.msg.html


(defclass unity_package::Simulink2Arduino
  :super ros::object
  :slots (_torque_reference ))

(defmethod unity_package::Simulink2Arduino
  (:init
   (&key
    ((:torque_reference __torque_reference) 0.0)
    )
   (send-super :init)
   (setq _torque_reference (float __torque_reference))
   self)
  (:torque_reference
   (&optional __torque_reference)
   (if __torque_reference (setq _torque_reference __torque_reference)) _torque_reference)
  (:serialization-length
   ()
   (+
    ;; float64 _torque_reference
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _torque_reference
       (sys::poke _torque_reference (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _torque_reference
     (setq _torque_reference (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get unity_package::Simulink2Arduino :md5sum-) "b553eb5fddc8e8c8cb9caa506e3fefe4")
(setf (get unity_package::Simulink2Arduino :datatype-) "unity_package/Simulink2Arduino")
(setf (get unity_package::Simulink2Arduino :definition-)
      "float64 torque_reference

")



(provide :unity_package/Simulink2Arduino "b553eb5fddc8e8c8cb9caa506e3fefe4")


