
(cl:in-package :asdf)

(defsystem "unity_package-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Arduino2Simulink" :depends-on ("_package_Arduino2Simulink"))
    (:file "_package_Arduino2Simulink" :depends-on ("_package"))
    (:file "Simulink2Arduino" :depends-on ("_package_Simulink2Arduino"))
    (:file "_package_Simulink2Arduino" :depends-on ("_package"))
    (:file "Simulink2MotionPC" :depends-on ("_package_Simulink2MotionPC"))
    (:file "_package_Simulink2MotionPC" :depends-on ("_package"))
    (:file "Simulink2Unity" :depends-on ("_package_Simulink2Unity"))
    (:file "_package_Simulink2Unity" :depends-on ("_package"))
    (:file "Unity2Simulink" :depends-on ("_package_Unity2Simulink"))
    (:file "_package_Unity2Simulink" :depends-on ("_package"))
    (:file "UnityMsg" :depends-on ("_package_UnityMsg"))
    (:file "_package_UnityMsg" :depends-on ("_package"))
  ))