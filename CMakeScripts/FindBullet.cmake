# - Try to find Bullet
# Once done this will define
#
#  BULLET_FOUND - system has bullet
#  BULLET_INCLUDE_DIR - the bullet include directory
#  BULLET_LIBRARIES - Link these to use Collada DOM
#

  SET(BULLETDYNAMICS "BulletDynamics")
  SET(BULLETCOLLISION "BulletCollision")
  SET(BULLETMATH "LinearMath")
  SET(BULLETSOFTBODY "BulletSoftBody")
  SET(BULLETMULTITHREADED "BulletMultiThreaded")

FIND_PATH(BULLET_INCLUDE_DIR NAMES btBulletCollisionCommon.h
  PATHS
  ${BULLET_DEPS_INCLUDE_DIR}
  ${PROJECT_BINARY_DIR}/include
  ${PROJECT_SOURCE_DIR}/include
  ${PROJECT_SOURCE_DIR}/libraries/bullet/include
  ENV CPATH
  /usr/include
  /usr/include/bullet/
  /usr/local/include
  /opt/local/include
  NO_DEFAULT_PATH
)

FIND_LIBRARY(LIBBULLETDYNAMICS
  NAMES 
  ${BULLETDYNAMICS}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/libraries
  ${PROJECT_SOURCE_DIR}/libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/lib/x86_64-linux-gnu
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETDYNAMICS)
    MESSAGE ("WARNING: Could not find Bullet Dynamics - depending targets will be disabled.")
ENDIF(NOT LIBBULLETDYNAMICS)


FIND_LIBRARY(LIBBULLETCOLLISION
  NAMES 
  ${BULLETCOLLISION}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/libraries
  ${PROJECT_SOURCE_DIR}/libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/lib/x86_64-linux-gnu
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETCOLLISION)
    MESSAGE ("WARNING: Could not find Bullet Collision - depending targets will be disabled.")
ENDIF(NOT LIBBULLETCOLLISION)

FIND_LIBRARY(LIBBULLETMATH
  NAMES 
  ${BULLETMATH}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/libraries
  ${PROJECT_SOURCE_DIR}/libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/lib/x86_64-linux-gnu
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETMATH)
    MESSAGE ("WARNING: Could not find Bullet Math - depending targets will be disabled.")
ENDIF(NOT LIBBULLETMATH)

FIND_LIBRARY(LIBBULLETSOFTBODY
  NAMES 
  ${BULLETSOFTBODY}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/libraries
  ${PROJECT_SOURCE_DIR}/libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/lib/x86_64-linux-gnu
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETSOFTBODY)
    MESSAGE ("WARNING: Could not find Bullet SoftBody - depending targets will be disabled.")
ENDIF(NOT LIBBULLETSOFTBODY)


FIND_LIBRARY(LIBBULLETMULTITHREADED
  NAMES 
  ${BULLETMULTITHREADED}
  PATHS
  ${BULLET_DEPS_LIB_DIR}
  ${PROJECT_BINARY_DIR}/lib
  ${PROJECT_SOURCE_DIR}/lib
  ${PROJECT_SOURCE_DIR}/libraries
  ${PROJECT_SOURCE_DIR}/libraries/bullet/lib
  ENV LD_LIBRARY_PATH
  ENV LIBRARY_PATH
  /usr/lib
  /usr/lib/x86_64-linux-gnu
  /usr/local/lib
  /opt/local/lib
  NO_DEFAULT_PATH
)

IF(NOT LIBBULLETMULTITHREADED)
    MESSAGE ("WARNING: Could not find Bullet MultiThreaded - depending targets will be disabled.")
SET(BULLET_LIBRARIES ${LIBBULLETSOFTBODY} ${LIBBULLETDYNAMICS} ${LIBBULLETCOLLISION} ${LIBBULLETMATH})
ELSE(NOT LIBBULLETMULTITHREADED)

SET(BULLET_LIBRARIES ${LIBBULLETMULTITHREADED} ${LIBBULLETSOFTBODY} ${LIBBULLETDYNAMICS} ${LIBBULLETCOLLISION} ${LIBBULLETMATH})
ENDIF(NOT LIBBULLETMULTITHREADED)

IF(BULLET_INCLUDE_DIR AND BULLET_LIBRARIES)
  SET(BULLET_FOUND TRUE)
ENDIF(BULLET_INCLUDE_DIR AND BULLET_LIBRARIES)

# show the BULLET_INCLUDE_DIR and BULLET_LIBRARIES variables only in the advanced view
IF(BULLET_FOUND)
  MARK_AS_ADVANCED(BULLET_INCLUDE_DIR BULLET_LIBRARIES )
ENDIF(BULLET_FOUND)
