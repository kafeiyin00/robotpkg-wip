# robotpkg depend.mk for:	wip/py-prf-gazebo-ros-pkgs
# Created:			Olivier Stasse on Mer, 3 May 2017
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_PRF_GAZEBO_ROS_PKGS_DEPEND_MK:=	${PY_PRF_GAZEBO_ROS_PKGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-prf-gazebo-ros-pkgs
endif

ifeq (+,$(PY_PRF_GAZEBO_ROS_PKGS_DEPEND_MK)) # ---------------------------

include ../../mk/robotpkg.prefs.mk  # for OS_VERSION
include ../../mk/sysdep/python.mk   # for PKGTAG.python

PREFER.py-prf-gazebo-ros-pkgs?=	robotpkg

DEPEND_USE+=				py-prf-gazebo-ros-pkgs

ifneq (,$(filter 16.04,${OS_VERSION}))
  DEPEND_ABI.py-prf-gazebo-ros-pkgs?=	${PKGTAG.python-}prf-gazebo-ros-pkgs>=2.6.5<3.0.0
else
  DEPEND_ABI.py-prf-gazebo-ros-pkgs?=	${PKGTAG.python-}prf-gazebo-ros-pkgs>=3.0.1
endif

DEPEND_DIR.py-prf-gazebo-ros-pkgs?=	../../wip/py-prf-gazebo-ros-pkgs

SYSTEM_SEARCH.py-prf-gazebo-ros-pkgs=					\
  'include/gazebo_ros_control/gazebo_ros_control_plugin.h'		\
  'include/gazebo_ros_control/default_robot_hw_sim.h'			\
  'include/gazebo_ros_control/robot_hw_sim.h'				\
  'share/gazebo_ros_control/cmake/gazebo_ros_controlConfig.cmake'	\
  'share/gazebo_ros_control/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/gazebo_ros_control.pc:/Version/s/[^0-9.]//gp'		\
  '${PYTHON_SYSLIBSEARCH}/gazebo_msgs/__init__.py'

endif # PY_PRF_GAZEBO_ROS_PKGS_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
