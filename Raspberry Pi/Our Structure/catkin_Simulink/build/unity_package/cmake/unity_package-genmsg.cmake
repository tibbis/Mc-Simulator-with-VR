# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "unity_package: 6 messages, 0 services")

set(MSG_I_FLAGS "-Iunity_package:/home/mcsim/catkin_Simulink/src/unity_package/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(unity_package_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" NAME_WE)
add_custom_target(_unity_package_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unity_package" "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" ""
)

get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" NAME_WE)
add_custom_target(_unity_package_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unity_package" "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" ""
)

get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" NAME_WE)
add_custom_target(_unity_package_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unity_package" "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" ""
)

get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" NAME_WE)
add_custom_target(_unity_package_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unity_package" "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" ""
)

get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" NAME_WE)
add_custom_target(_unity_package_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unity_package" "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" ""
)

get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" NAME_WE)
add_custom_target(_unity_package_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "unity_package" "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
)
_generate_msg_cpp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
)
_generate_msg_cpp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
)
_generate_msg_cpp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
)
_generate_msg_cpp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
)
_generate_msg_cpp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
)

### Generating Services

### Generating Module File
_generate_module_cpp(unity_package
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(unity_package_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(unity_package_generate_messages unity_package_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_cpp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_cpp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_cpp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_cpp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_cpp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_cpp _unity_package_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unity_package_gencpp)
add_dependencies(unity_package_gencpp unity_package_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unity_package_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
)
_generate_msg_eus(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
)
_generate_msg_eus(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
)
_generate_msg_eus(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
)
_generate_msg_eus(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
)
_generate_msg_eus(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
)

### Generating Services

### Generating Module File
_generate_module_eus(unity_package
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(unity_package_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(unity_package_generate_messages unity_package_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_eus _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_eus _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_eus _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_eus _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_eus _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_eus _unity_package_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unity_package_geneus)
add_dependencies(unity_package_geneus unity_package_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unity_package_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
)
_generate_msg_lisp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
)
_generate_msg_lisp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
)
_generate_msg_lisp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
)
_generate_msg_lisp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
)
_generate_msg_lisp(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
)

### Generating Services

### Generating Module File
_generate_module_lisp(unity_package
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(unity_package_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(unity_package_generate_messages unity_package_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_lisp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_lisp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_lisp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_lisp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_lisp _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_lisp _unity_package_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unity_package_genlisp)
add_dependencies(unity_package_genlisp unity_package_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unity_package_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
)
_generate_msg_nodejs(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
)
_generate_msg_nodejs(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
)
_generate_msg_nodejs(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
)
_generate_msg_nodejs(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
)
_generate_msg_nodejs(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
)

### Generating Services

### Generating Module File
_generate_module_nodejs(unity_package
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(unity_package_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(unity_package_generate_messages unity_package_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_nodejs _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_nodejs _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_nodejs _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_nodejs _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_nodejs _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_nodejs _unity_package_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unity_package_gennodejs)
add_dependencies(unity_package_gennodejs unity_package_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unity_package_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
)
_generate_msg_py(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
)
_generate_msg_py(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
)
_generate_msg_py(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
)
_generate_msg_py(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
)
_generate_msg_py(unity_package
  "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
)

### Generating Services

### Generating Module File
_generate_module_py(unity_package
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(unity_package_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(unity_package_generate_messages unity_package_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Arduino2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_py _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Unity.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_py _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Unity2Simulink.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_py _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2Arduino.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_py _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/UnityMsg.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_py _unity_package_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mcsim/catkin_Simulink/src/unity_package/msg/Simulink2MotionPC.msg" NAME_WE)
add_dependencies(unity_package_generate_messages_py _unity_package_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(unity_package_genpy)
add_dependencies(unity_package_genpy unity_package_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS unity_package_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/unity_package
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(unity_package_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/unity_package
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(unity_package_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/unity_package
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(unity_package_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/unity_package
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(unity_package_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/unity_package
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(unity_package_generate_messages_py std_msgs_generate_messages_py)
endif()
