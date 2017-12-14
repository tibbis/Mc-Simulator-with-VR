;; Auto-generated. Do not edit!


(when (boundp 'unity_package::Unity2Simulink)
  (if (not (find-package "UNITY_PACKAGE"))
    (make-package "UNITY_PACKAGE"))
  (shadow 'Unity2Simulink (find-package "UNITY_PACKAGE")))
(unless (find-package "UNITY_PACKAGE::UNITY2SIMULINK")
  (make-package "UNITY_PACKAGE::UNITY2SIMULINK"))

(in-package "ROS")
;;//! \htmlinclude Unity2Simulink.msg.html


(defclass unity_package::Unity2Simulink
  :super ros::object
  :slots (_running _offroad _crash _incline _leaning ))

(defmethod unity_package::Unity2Simulink
  (:init
   (&key
    ((:running __running) nil)
    ((:offroad __offroad) nil)
    ((:crash __crash) 0)
    ((:incline __incline) 0.0)
    ((:leaning __leaning) 0.0)
    )
   (send-super :init)
   (setq _running __running)
   (setq _offroad __offroad)
   (setq _crash (round __crash))
   (setq _incline (float __incline))
   (setq _leaning (float __leaning))
   self)
  (:running
   (&optional __running)
   (if __running (setq _running __running)) _running)
  (:offroad
   (&optional __offroad)
   (if __offroad (setq _offroad __offroad)) _offroad)
  (:crash
   (&optional __crash)
   (if __crash (setq _crash __crash)) _crash)
  (:incline
   (&optional __incline)
   (if __incline (setq _incline __incline)) _incline)
  (:leaning
   (&optional __leaning)
   (if __leaning (setq _leaning __leaning)) _leaning)
  (:serialization-length
   ()
   (+
    ;; bool _running
    1
    ;; bool _offroad
    1
    ;; int32 _crash
    4
    ;; float32 _incline
    4
    ;; float32 _leaning
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _running
       (if _running (write-byte -1 s) (write-byte 0 s))
     ;; bool _offroad
       (if _offroad (write-byte -1 s) (write-byte 0 s))
     ;; int32 _crash
       (write-long _crash s)
     ;; float32 _incline
       (sys::poke _incline (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _leaning
       (sys::poke _leaning (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _running
     (setq _running (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _offroad
     (setq _offroad (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _crash
     (setq _crash (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _incline
     (setq _incline (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _leaning
     (setq _leaning (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_package::Unity2Simulink :md5sum-) "8e63d3aac35859f6526118315ffe95ce")
(setf (get unity_package::Unity2Simulink :datatype-) "unity_package/Unity2Simulink")
(setf (get unity_package::Unity2Simulink :definition-)
      "bool running
bool offroad
int32 crash
float32 incline
float32 leaning

")



(provide :unity_package/Unity2Simulink "8e63d3aac35859f6526118315ffe95ce")


