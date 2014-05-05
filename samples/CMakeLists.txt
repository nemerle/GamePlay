include(BuildHelpers.CMakeLists.txt)

include_directories(
    ${CMAKE_SOURCE_DIR}/gameplay/src
)

add_definitions(-D__linux__)
MESSAGE(${VORBIS_LIBRARIES})
set(GAMEPLAY_LIBRARIES
    gameplay
    ${LUA_LIBRARIES}
    ${PNG_LIBRARIES}
    ${ZLIB_LIBRARIES}
    ${VORBIS_LIBRARIES}
    ${BULLET_LIBRARIES}
    ${OPENAL_LIBRARY}
    ${GLEW_LIBRARIES}
    ${OPENGL_LIBRARIES}
    ${CMAKE_THREADS_LIBS_INIT}
    rt
    dl
    pthread
    gtk-x11-2.0
    glib-2.0
    gobject-2.0
)

#add_definitions(-lstdc++ -lgameplay -lm -llua -lz -lpng -lvorbis -logg -lBulletCollision -lBulletDynamics -lLinearMath -lopenal -LGLEW -lGL -lrt -ldl -lX11 -lpthread -lgtk-x11-2.0 -lglib-2.0 -lgobject-2.0)

add_subdirectory(browser)
add_subdirectory(character)
add_subdirectory(lua)
add_subdirectory(mesh)
add_subdirectory(particles)
add_subdirectory(racer)
add_subdirectory(spaceship)
